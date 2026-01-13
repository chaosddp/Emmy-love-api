local api = require('love-api.love_api')
local patch = require('patch')

local function uniformType(t)
    return string.gsub(t, "%s+", "")
end

local function capitalize(str)
    return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
end

local function safeDesc(src)
    return string.gsub(src, "\n", "\n---")
end

--- when a function argument is a table, we can try to generate a class for it (may be nested),
--- named as ModuleNameFunctionNameArgumentName(ChildName ...), like: LoveConf {window: LoveConfWindow {}}
local function genArgClass(module_name, func_name, arg)
    local cls_name = capitalize(module_name) .. capitalize(func_name)
    local cls_var_name = module_name:lower() .. "_" .. func_name

    local code = "---" .. safeDesc(arg.description) .. "\n"

    code = code .. "---@class " .. cls_name .. "\n"


    for i, field in ipairs(arg.table) do
        local field_type = uniformType(field.type)

        if field_type == "table" then
            local field_cls_name, field_cls_code = genArgClass(cls_name, field.name, field)

            --- insert the field class to front
            code = field_cls_code .. code

            field_type = field_cls_name
        end

        -- all fields are optional
        code = code .. "---@field " .. field.name .. "? " .. field_type .. " @" .. safeDesc(field.description) .. "\n"
    end

    code = code .. "local " .. cls_var_name .. "= {}\n\n"

    return cls_name, code
end

local function genReturns(moduleName, fun, variant)
    local returns = variant.returns
    local overload_code = ""
    local code = ""
    local num = 0
    if returns and #returns > 0 then
        num = #returns
        for i, ret in ipairs(returns) do
            -- check if this return type need to be patched
            local ret_type = uniformType(ret.type)

            local patch_ret_type = patch.genReturnPatch(moduleName, fun.name, ret.name)

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

local function genFunction(moduleName, fun, static)
    local code = "---" .. safeDesc(fun.description) .. "\n"
    local argList = ''

    for vIdx, variant in ipairs(fun.variants) do
        -- args
        local arguments = variant.arguments
        if arguments and #arguments > 0 then
            if vIdx == 1 then
                for argIdx, argument in ipairs(arguments) do
                    if argIdx == 1 then
                        argList = argument.name
                    else
                        argList = argList .. ', ' .. argument.name
                    end

                    local arg_type = uniformType(argument.type)

                    local patch_arg_type = patch.genArgPatch(moduleName, fun.name, argument.name)
                    if patch_arg_type then
                        arg_type = patch_arg_type
                    end

                    code = code ..
                        '---@param ' .. argument.name .. ' ' .. arg_type .. ' @' .. argument.description .. '\n'
                end
            else
                code = code .. '---@overload fun('
                for argIdx, argument in ipairs(arguments) do
                    local arg_type = uniformType(argument.type)

                    local patch_arg_type = patch.genArgPatch(moduleName, fun.name, argument.name)
                    if patch_arg_type then
                        arg_type = patch_arg_type
                    end

                    if argIdx == 1 then
                        code = code .. argument.name .. ':' .. arg_type
                    else
                        code = code .. ', '
                        code = code .. argument.name .. ':' .. arg_type
                    end
                end
                local type, _, _ = genReturns(moduleName, fun, variant)

                code = code .. '):' .. type
                code = code .. '\n'
            end
        end -- end of loop to parse arguments

        -- check if we need to patch the overload functions
        local patched_overload_code = patch.genOverloadPatch(moduleName, fun.name)

        if patched_overload_code then
            code = code .. patched_overload_code
        end

        if vIdx == 1 then
            local _, num, return_code = genReturns(moduleName, fun, variant)
            if num > 0 then
                code = code .. return_code .. '\n'
            end
        end
    end

    local dot = static and '.' or ':'
    code = code .. "function " .. moduleName .. dot .. fun.name .. "(" .. argList .. ") end\n\n"
    return code
end

local function genType(name, type)
    local code = "---@class " .. type.name
    if type.parenttype then
        code = code .. ' : ' .. type.parenttype
    else
        -- if we need patch the base class?
        local patch_base_cls = patch.getPatchBaseClass(name)

        if patch_base_cls then
            code = code .. ' : ' .. patch_base_cls
        end
    end
    code = code .. '\n'
    code = code .. '---' .. safeDesc(type.description) .. '\n'
    code = code .. 'local ' .. name .. ' = {}\n'
    -- functions
    if type.functions then
        for i, fun in ipairs(type.functions) do
            code = code .. genFunction(name, fun, false)
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

    -- add meta at begging, so it will not be parsed as executable code
    f:write("---@meta " .. name .. "\n\n")

    f:write("---@class " .. name .. '\n')
    if api.description then
        f:write('---' .. safeDesc(api.description) .. '\n')
    end
    f:write("local m = {}\n\n")

    -- types
    if api.types then
        for i, type in ipairs(api.types) do
            f:write('--region ' .. type.name .. '\n')
            f:write(genType(type.name, type))
            f:write('--endregion ' .. type.name .. '\n')
        end
    end

    -- enums
    if api.enums then
        for i, enum in ipairs(api.enums) do
            f:write(genEnum(enum))
        end
    end

    -- modules
    if api.modules then
        for i, m in ipairs(api.modules) do
            f:write("---@type " .. name .. '.' .. m.name .. '\n')
            f:write("m." .. m.name .. ' = nil\n\n')
            genModule(name .. '.' .. m.name, m)
        end
    end

    -- functions
    for i, fun in ipairs(api.functions) do
        f:write(genFunction('m', fun, true))
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

print('--finished.')
