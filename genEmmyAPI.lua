local api = require('love-api.love_api')
local patch = require('patch')

TARGET_VERSION = "12.0"

--- uniform the type string, like remove spaces
local function uniformType(t)
    return string.gsub(t, "%s+", "")
end

--- capitalize the first letter
local function capitalize(str)
    return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
end

--- convert the description to a valid one
local function safeDesc(src)
    return string.gsub(src, "\n", "\n---")
end

--- when a function/callback argument is a table, we can try to generate a class for it (may be nested), like callback love.conf.
--- named as ModuleNameFunctionNameArgumentName(ChildName ...).
local function genArgClass(module_name, func_name, arg)
    local cls_name = capitalize(module_name) .. capitalize(func_name)
    local cls_var_name = module_name:lower() .. "_" .. func_name

    local code = "---" .. safeDesc(arg.description) .. "\n"

    code = code .. "---@class " .. cls_name .. "\n"


    for _, field in ipairs(arg.table) do
        local is_removed = patch.isRemoved(cls_name, nil, field.name, TARGET_VERSION)

        if not is_removed then
            local field_type = uniformType(field.type)

            -- the field may need to be a class too
            if field_type == "table" then
                local field_cls_name, field_cls_code = genArgClass(cls_name, field.name, field)

                --- insert the field class to the front
                code = field_cls_code .. code

                field_type = field_cls_name
            end

            local is_deprecated, deprecated_decl = patch.genDeprecatedPatch(cls_name, nil, field.name, TARGET_VERSION)

            if is_deprecated then
                code = code .. deprecated_decl .. "\n"
            end

            code = code .. "---@field " .. field.name .. " " .. field_type .. " @" .. safeDesc(field.description) .. "\n"
        end
    end

    code = code .. "local " .. cls_var_name .. "= {}\n\n"

    return cls_name, code
end

--- generate the returns code, it will try to apply the manual patch to the return type
--- @return string return code for overload definition
--- @return number number of returns
--- @return string return code for function definition
local function genReturns(module_name, fun, variant)
    local returns = variant.returns
    local overload_code = ""
    local code = ""
    local num = 0

    if returns and #returns > 0 then
        num = #returns
        for i, ret in ipairs(returns) do
            -- check if this return type need to be patched
            local ret_type = uniformType(ret.type)

            local patch_ret_type = patch.genReturnPatch(module_name, fun.name, ret.name)

            if patch_ret_type then
                ret_type = patch_ret_type
            end

            if i == 1 then
                overload_code = ret_type
                code = code .. "---@return " .. ret_type .. " " .. ret.name .. " " .. safeDesc(ret.description)
            else
                overload_code = overload_code .. ', ' .. ret_type
                code = code .. "\n---@return " .. ret_type .. " " .. ret.name .. " " .. safeDesc(ret.description)
            end
        end
    else
        overload_code = "void"
        code = overload_code
    end

    return overload_code, num, code
end

--- generate a function for a module
--- @param module_name string name of the module
--- @param module_var_name string name of the module variable (for definition)
--- @param fun table function definition
--- @param static boolean whether the function is static
local function genFunction(module_name, module_var_name, fun, static)
    local is_removed = patch.isRemoved(module_name, fun.name, nil, TARGET_VERSION)

    if is_removed then
        return ""
    end

    local code = "---" .. safeDesc(fun.description) .. "\n"
    local argList = ''

    for vIdx, variant in ipairs(fun.variants) do
        -- args
        local arguments = variant.arguments

        -- if there is not any arguments, then it should a overload with no arguments
        if vIdx > 1 and (not arguments or #arguments == 0) then
            code = code .. '---@overload fun()\n'
        end

        if arguments and #arguments > 0 then
            if vIdx == 1 then
                for argIdx, argument in ipairs(arguments) do
                    if argIdx == 1 then
                        argList = argument.name
                    else
                        argList = argList .. ', ' .. argument.name
                    end

                    local arg_type = uniformType(argument.type)

                    --- try to patch the argument type
                    local patch_arg_type = patch.genArgPatch(module_name, fun.name, argument.name)
                    if patch_arg_type then
                        arg_type = patch_arg_type
                    end

                    -- if a argument has default value, then we mark it as optional
                    local arg_name = argument.name

                    if argument.default then
                        arg_name = arg_name .. '?'
                    end

                    code = code ..
                        '---@param ' .. arg_name .. ' ' .. arg_type .. ' @' .. argument.description .. '\n'
                end
            else
                code = code .. '---@overload fun('
                for argIdx, argument in ipairs(arguments) do
                    local arg_type = uniformType(argument.type)

                    local patch_arg_type = patch.genArgPatch(module_name, fun.name, argument.name)
                    if patch_arg_type then
                        arg_type = patch_arg_type
                    end

                    -- if a argument has default value, then we mark it as optional
                    local arg_name = argument.name

                    if argument.default then
                        arg_name = arg_name .. '?'
                    end

                    if argIdx == 1 then
                        code = code .. arg_name .. ':' .. arg_type
                    else
                        code = code .. ', '
                        code = code .. arg_name .. ':' .. arg_type
                    end
                end
                local type, _, _ = genReturns(module_name, fun, variant)

                code = code .. '):' .. type
                code = code .. '\n'
            end
        end -- end of loop to parse arguments

        -- check if we need to patch the overload functions
        local patched_overload_code = patch.genOverloadPatch(module_name, fun.name)

        if patched_overload_code then
            code = code .. patched_overload_code
        end

        if vIdx == 1 then
            local _, num, return_code = genReturns(module_name, fun, variant)
            if num > 0 then
                code = code .. return_code .. '\n'
            end
        end
    end

    local dot = static and '.' or ':'
    code = code .. "function " .. module_var_name .. dot .. fun.name .. "(" .. argList .. ") end\n\n"
    return code
end

local function genType(cls_var_name, type)
    local code = "---@class " .. type.name

    -- TODO: need to replace removed type, not just remove them
    -- local is_removed = patch.isRemoved(type.name, nil, nil, TARGET_VERSION)

    -- if is_removed then
    --     return ""
    -- end

    if type.parenttype then
        code = code .. ' : ' .. type.parenttype
    else
        -- if we need patch the base class?
        local patch_base_cls = patch.getPatchBaseClass(type.name)

        if patch_base_cls then
            code = code .. ' : ' .. patch_base_cls
        end
    end
    code = code .. '\n'
    code = code .. '---' .. safeDesc(type.description) .. '\n'
    code = code .. 'local ' .. cls_var_name .. ' = {}\n'
    -- functions
    if type.functions then
        for i, fun in ipairs(type.functions) do
            code = code .. genFunction(type.name, cls_var_name, fun, false)
        end
    end

    return code
end

-- we use alias instead previous enum, as we should only use the generate api as hinting, do reference them in final code.
local function genEnum(enum)
    local code = '---' .. safeDesc(enum.description) .. '\n'
    code = code .. '---@alias ' .. enum.name .. '\n'

    for i, const in ipairs(enum.constants) do
        code = code .. '---| ' .. "'" .. const.name .. "'" .. '\t#' .. safeDesc(const.description) .. '\n'
    end

    code = code .. '\n'

    return code
end

local function genModule(name, api)
    local f = assert(io.open("api/" .. name .. ".lua", 'w'))

    -- add meta at begging, so it will not be parsed as executable code (avoid warnings like 'no return')
    f:write("---@meta " .. name .. "\n\n")

    -- module definition
    f:write("---@class " .. name .. '\n')
    if api.description then
        f:write('---' .. safeDesc(api.description) .. '\n')
    end
    f:write("local m = {}\n\n")

    -- types
    if api.types then
        for _, type in ipairs(api.types) do
            f:write('--region ' .. type.name .. '\n\n')
            f:write(genType(type.name, type))
            f:write('--endregion ' .. type.name .. '\n\n')
        end
    end

    -- enums
    if api.enums then
        for _, enum in ipairs(api.enums) do
            f:write(genEnum(enum))
        end
    end

    -- modules
    if api.modules then
        for _, m in ipairs(api.modules) do
            f:write("---@type " .. name .. '.' .. m.name .. '\n')
            f:write("m." .. m.name .. ' = nil\n\n')

            -- generate module for top level modules like: love.window
            genModule(name .. '.' .. m.name, m)
        end
    end

    -- functions
    for i, fun in ipairs(api.functions) do
        f:write(genFunction(name, 'm', fun, true))
    end

    -- callbacks
    if api.callbacks then
        f:write("-- callbacks \n\n")

        for i, callback in ipairs(api.callbacks) do
            -- callback is same as function, but without body, only a type
            local callback_code = "---" .. safeDesc(callback.description) .. "\n"
            callback_code = callback_code .. "---@type fun("

            -- callback only has one variant
            if callback.variants[1].arguments and #callback.variants[1].arguments > 0 then
                for argIdx, argument in ipairs(callback.variants[1].arguments) do
                    local argument_type = uniformType(argument.type)

                    if argument.type == "table" and argument.table then
                        local argument_cls_code = nil

                        argument_type, argument_cls_code = genArgClass(name, callback.name, argument)

                        f:write(argument_cls_code)
                        f:write("\n")
                    end

                    if argIdx == 1 then
                        callback_code = callback_code .. argument.name .. ':' .. argument_type
                    else
                        callback_code = callback_code .. ', ' .. argument.name .. ':' .. argument_type
                    end
                end
            end

            callback_code = callback_code .. ")\n"
            callback_code = callback_code .. "m." .. callback.name .. " = nil\n\n"

            f:write(callback_code)
        end
    end

    -- check if we have love12 patch for this module
    local pf = io.open("love12/" .. name .. ".lua", 'r')

    if pf then
        f:write("\n\n--love12 patch begin\n\n")
        f:write(pf:read('*a'))
        pf:close()
        f:write("\n\n--love12 patch end\n\n")
    end

    f:write("return m")
    f:close()
end

local function genPatch()
    local f = assert(io.open("api/patch.lua", 'w'))

    for i, d in ipairs(patch.definitions) do
        f:write(d)
        f:write("\n")
    end

    f:close()
end

-- additional definitions that not easy to generate automatically
genPatch()
genModule('love', api)

-- write love.https.lua and love.sensor.lua to api folder
for _, file in ipairs({ "love.https.lua", "love.sensor.lua" }) do
    local f = assert(io.open("love12/" .. file, 'r'))
    local code = f:read('*a')
    f:close()

    f = assert(io.open("api/" .. file, 'w'))
    f:write(code)
    f:close()
end

print('--finished.')
