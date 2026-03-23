---@diagnostic disable: invert-if
local love_api = require "love-api.love_api"

local module_annotation_template = table.concat({
    "--- @meta %s",  -- module name
    "\n",
    "--- @class %s", -- module name
    "local m = {}",  -- module table
    "\n",
    "%s",            -- enum annotations
    "\n",
    "%s",            -- class annotations
    "\n",
    "%s",            -- callback annotations
    "\n",
    "%s",            -- function annotations
    "\n",
    "%s",            -- field annotations
    "\n",
    "%s",            -- love12 patch
    "\n",
    "return m",      -- return the module table
}, "\n")


--- definitions

--- @class Function
--- @field name string @name of function
--- @field description string @description of function
--- @field variants? FunctionVariant[] @variants of function

--- @class ArgumentTableField
--- @field type string @type of a field
--- @field name string @name of field
--- @field description string @description of field
--- @field default? string @default value of field
--- @field table? ArgumentTableField[] @table definition for table argument, we have make this as a internal class type

--- @class FunctionArgument
--- @field type string @type of argument
--- @field name string @name of argument
--- @field description string @description of argument
--- @field table? table @table definition for table argument, we have make this as a internal class type
--- @field default? string @default value of argument

--- @class FunctionReturn
--- @field type string @type of return
--- @field name string @name of return
--- @field description string @description of return

--- @class FunctionVariant
--- @field description string @description of variant
--- @field arguments? FunctionArgument[] @arguments of variant
--- @field returns? FunctionReturn[] @returns of current variant

--- @class Callback
--- @field name string @name of callback
--- @field description string @description of callback
--- @field variants FunctionVariant[] @variants of callback

--- @class EnumField
--- @field name string @name of field
--- @field description string @description of field

--- @class Enum
--- @field name string @name of enum
--- @field description string @description of enum
--- @field constants EnumField[] @ fields of enum

--- @class ClassDef
--- @field name string @name of class
--- @field description string @description of class
--- @field constructors? string[] @constructors of class
--- @field supertypes? string[] @supertypes of class
--- @field functions? Function[] @functions of class

--- @class Module
--- @field name? string @name of module
--- @field version? string @love version
--- @field description? string @description of love
--- @field modules? Module[] @modules of love
--- @field enums? Enum[] @enums of love
--- @field callbacks? Callback[] @callbacks of love
--- @field types? table<string, any> @types of love
--- @field functions? table<string, any> @functions of love

--- check if a table has a field, return true if the table has the field
--- @param t table @table to check
--- @param k string @key to check
--- @return boolean @true if the table has the field, even the field value is nil
local function hasField(t, k)
    for _k in pairs(t) do
        if k == _k then
            return true
        end
    end

    return false
end

--- correct type name
--- @param type_name string @type name to correct
--- @return string @corrected type name
local function correctType(type_name)
    if type_name == "Variant" then
        return "any"
    end

    return string.gsub(type_name, "%s+", "")
end

--- capitalize the first letter
local function capitalize(str)
    return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
end

--- convert the description to a valid one
--- @param src string @string may contains multiple lines
--- @return string @safe description
local function safeDesc(src)
    return string.gsub(src, "\n", "\n---\n---")
end

--- write content to file
--- @param content string @content to write
--- @param file string @file to write
local function writeFile(content, file)
    local f = assert(io.open(file, "w"))
    f:write(content)
    f:close()
end

--- read content from file
--- @param file string @file to read
--- @return string @content
local function readFile(file)
    local f = io.open(file, "r")

    if f == nil then
        return ""
    end

    local content = f:read("a")
    f:close()

    return content
end


--- @param func Function @function definition
--- @param parent_inst_name string @parent instance name, used to attach function to instance
local function genFunction(func, parent_inst_name, is_class)
    -- use first variant as default variant, arguments description will be annotated under the description
    -- other variants will be 'overload', 'overload's do not have argument description
    -- if argument has field "default", then it is optional
    local function_seperator = is_class and ":" or "."

    local annotation_list = {
        string.format("--- %s", safeDesc(func.description)),
    }

    -- parameter list used to generate function
    local param_name_list = {}

    -- generate variants if there is any
    if func.variants and #func.variants > 0 then
        -- use first one to generate function annotation
        local default_variant = func.variants[1]

        -- function parameters
        if default_variant.arguments then
            -- default function parameters
            for _, arg in ipairs(default_variant.arguments) do
                local arg_name = arg.name
                local arg_type = correctType(arg.type)
                local arg_description = arg.description

                table.insert(param_name_list, arg_name)

                table.insert(annotation_list,
                    string.format(
                        "--- @param %s %s @%s",
                        arg_name,
                        arg_type,
                        safeDesc(arg_description)
                    ))
            end
        end

        -- function returns
        if default_variant.returns then
            for _, ret in ipairs(default_variant.returns) do
                local ret_type = correctType(ret.type)
                local ret_description = ret.description

                table.insert(annotation_list,
                    string.format(
                        "--- @return %s @%s",
                        ret_type,
                        safeDesc(ret_description)
                    )
                )
            end
        end

        -- generate overloads
        for i = 2, #func.variants do
            local variant_param_list = {}
            local variant_return_list = {}
            local variant = func.variants[i]

            if variant.arguments then
                for j = 1, #variant.arguments do
                    local arg = variant.arguments[j]
                    local arg_type = correctType(arg.type)
                    local arg_name = arg.name

                    table.insert(variant_param_list,
                        string.format(
                            "%s: %s",
                            arg_name,
                            arg_type
                        )
                    )
                end

                if variant.returns then
                    for j = 1, #variant.returns do
                        local variant_return = correctType(variant.returns[j].type)
                        table.insert(variant_return_list, variant_return)
                    end
                end
            end

            -- if no returns, then void
            if #variant_return_list == 0 then
                table.insert(variant_return_list, "void")
            end

            -- generate variant like: @overload fun(a: number, b: bool):void
            table.insert(annotation_list,
                string.format(
                    "--- @overload fun(%s):%s",
                    table.concat(variant_param_list, ", "),
                    table.concat(variant_return_list, ", ")
                )
            )
        end
    end

    -- function declaration
    local func_decl = string.format(
        "function %s%s%s(%s) end",
        parent_inst_name,
        function_seperator,
        func.name,
        table.concat(param_name_list, ", ")
    )

    table.insert(annotation_list, func_decl)
    table.insert(annotation_list, "\n")

    return table.concat(annotation_list, "\n")
end

--- @param cls ClassDef
--- @return string @annotation of class
local function genClass(cls)
    local annotation_list = {}

    local type_annotation = string.format("--- @class %s", cls.name)

    if cls.supertypes then
        type_annotation = type_annotation .. ": " .. table.concat(cls.supertypes, ", ")
    end

    -- class type
    table.insert(annotation_list, type_annotation)


    -- class description
    table.insert(annotation_list, string.format("--- %s", safeDesc(cls.description)))

    -- class declaration table
    table.insert(annotation_list, string.format("local %s = {}\n", cls.name))

    if cls.functions and #cls.functions > 0 then
        for _, func in ipairs(cls.functions) do
            local func_annotation = genFunction(func, cls.name, true)

            table.insert(annotation_list, func_annotation)
        end
    end

    return table.concat(annotation_list, "\n")
end


--- @param enum Enum @enum definition
--- @return string @generated enum annotation
local function genEnum(enum)
    local annotation_list = {
        string.format("--- %s", safeDesc(enum.description)),
        string.format("--- @alias %s", enum.name),
    } -- all the part of annotation

    for _, field in ipairs(enum.constants) do
        local field_name = field.name
        local field_description = field.description

        local field_annotation = string.format(
            "---| '%s' #%s",
            field_name,
            safeDesc(field_description)
        )

        table.insert(annotation_list, field_annotation)
    end

    return table.concat(annotation_list, "\n")
end

--- generate type annotation from a table field if the field type is table and has field "table",
--- then we will generate a type for it recursively, name startswith function/callback name, such argument of love.conf
--- @param name string @name of internal type
--- @param fields ArgumentTableField[] @table field
--- @return string @name of internal type
--- @return string @generated internal type annotation
--- @return string[]? @generated nested internal type annotations
local function genInternalType(name, fields)
    local field_annotation_list = {}       -- field of current type
    local nested_type_annotation_list = {} -- nested type annotation
    local type_name = capitalize(name)     -- type name of current type

    for _, field in ipairs(fields) do
        local field_type = correctType(field.type)
        local field_name = field.name
        local field_description = field.description

        -- nested table field
        if field_type == "table" and field.table then
            local field_table = field.table

            -- this is a nested type, so we need to update the type name
            field_type = type_name .. capitalize(field_name)

            -- generate nested types
            local _, sub_field_internal_annotation, nested_fields_internal_annotations = genInternalType(field_type,
                field_table)

            table.insert(nested_type_annotation_list, sub_field_internal_annotation)

            if nested_fields_internal_annotations then
                for _, ann in ipairs(nested_fields_internal_annotations) do
                    table.insert(field_annotation_list, ann)
                end
            end
        end


        local field_annotation_str = string.format(
            "--- @field %s %s @%s",
            field_name,
            field_type,
            safeDesc(field_description)
        )

        table.insert(field_annotation_list, field_annotation_str)
    end

    local annotation = string.format(
        "--- @class %s\n%s",
        type_name,
        table.concat(field_annotation_list, "\n")
    )

    return type_name, annotation, nested_type_annotation_list
end

--- @param module string @name of parent module, callbacks will be generated under this module
--- @param callback Callback @callback definition
--- @return string @generated callback annotation
local function genCallback(module, callback)
    -- NOTE: we will ignore variants more than 2 for callbacks, and callback has no return value

    local interval_types = {}
    local description = callback.description
    local name = callback.name

    -- callback annotation as following
    -- callback description
    -- @type fun(any):void

    local params_list = {}
    local variant = callback.variants[1]

    if variant and variant.arguments then
        for _, arg in ipairs(variant.arguments) do
            local arg_type = arg.type

            -- table argument with field "table" need special treatment
            if arg_type == "table" and arg.table then
                local t_name, field_annotation, nested_field_annotation_list = genInternalType(name, arg.table)

                table.insert(interval_types, field_annotation)

                if nested_field_annotation_list then
                    for _, nested_field_annotation in ipairs(nested_field_annotation_list) do
                        table.insert(interval_types, nested_field_annotation)
                    end
                end

                table.insert(params_list, string.format("%s: %s", arg.name, t_name))
            else
                table.insert(params_list, string.format("%s: %s", arg.name, correctType(arg_type)))
            end
        end
    end

    local params_str = table.concat(params_list, ", ")
    local fun_type_str = string.format("fun(%s):void", params_str)

    local annotation = string.format("%s\n\n--- %s\n--- @type %s\n%s.%s = nil",
        table.concat(interval_types, "\n\n"),
        safeDesc(description),
        fun_type_str,
        module,
        name
    )

    return annotation
end

--- @param type_name string @type name of module, like Image, Texture
--- @param module_name string @absolute name of module, like love.graphics
--- @param definition Module @module definition
--- @param output_dir string @output directory
local function genModule(type_name, module_name, definition, output_dir)
    local callback_annotation_list = {}
    local function_annotation_list = {}
    local enum_annotation_list = {}
    local class_annotation_list = {}
    local fields_annotation_list = {} -- for submodules now


    -- generate callback annotations if there are any
    if definition.callbacks then
        local callbacks = definition.callbacks


        for _, callback in ipairs(callbacks) do
            -- since we will make love as m locally, use m as module name for generated callback annotation
            local callback_annotation = genCallback("m", callback)

            table.insert(callback_annotation_list, callback_annotation)
        end
    end

    -- generate enum annotations if there are any
    if definition.enums then
        for _, enum in ipairs(definition.enums) do
            local enum_annotation = genEnum(enum)

            table.insert(enum_annotation_list, enum_annotation)
            table.insert(enum_annotation_list, "\n")
        end
    end

    -- generate function annotations if there are any
    if definition.functions then
        for _, func in ipairs(definition.functions) do
            local func_annotation = genFunction(func, "m") -- for module, function will attach to module "m"

            table.insert(function_annotation_list, func_annotation)
        end
    end

    -- generate class annotations if there are any
    if definition.types then
        for _, cls in ipairs(definition.types) do
            local class_annotation = genClass(cls) -- for module, class will attach to module "m"

            table.insert(class_annotation_list, class_annotation)
        end
    end

    -- generate module annotation if there are any
    if definition.modules then
        for _, sub_module in ipairs(definition.modules) do
            if sub_module.name then
                local sub_module_name = module_name .. "." .. sub_module.name

                -- submodule has same name and module path
                genModule(sub_module_name, sub_module_name, sub_module, output_dir)

                -- add submodule to as a field, so that it can be parsed correctly
                table.insert(
                    fields_annotation_list,
                    string.format("--- @type %s\nm.%s = nil\n", sub_module_name, sub_module.name)
                )
            end
        end
    end

    -- combine all annotations into one
    local callback_annotation_str = table.concat(callback_annotation_list, "\n")
    local function_annotation_str = table.concat(function_annotation_list, "\n")
    local enum_annotation_str = table.concat(enum_annotation_list, "\n")
    local class_annotation_str = table.concat(class_annotation_list, "\n")
    local field_annotation_str = table.concat(fields_annotation_list, "\n")
    local module_patch = readFile("love12/" .. module_name .. ".lua")

    local module_annotation_str = string.format(
        module_annotation_template,
        type_name,
        type_name,
        enum_annotation_str,
        class_annotation_str,
        callback_annotation_str,
        function_annotation_str,
        field_annotation_str,
        module_patch
    )

    -- write to file
    writeFile(module_annotation_str, output_dir .. "/" .. module_name .. ".lua")

    print("Generated " .. module_name .. ".lua")
end

local out_dir = "api"

-- generating start here
genModule("love", "love", love_api, out_dir)

-- additional patch files
for _, file in ipairs({ "love.https", "love.sensor" }) do
    local patch_file = "love12/" .. file .. ".lua"
    local patch_content = readFile(patch_file)

    writeFile(patch_content, out_dir .. "/" .. file .. ".lua")
end
