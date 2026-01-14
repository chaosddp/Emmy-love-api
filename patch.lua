-- use this to generate shared definition for different functions/modules

local definitions = {
    [[
---@class DisplayModeOptions
---@field fullscreen? boolean fullscreen (true), or windowed (false).
---@field fullscreentype? FullscreenType fullscreen mode.
---@field vsync? number v to enable vsync, 0 to disable vsync, -1 to use the adaptive vsync
---@field msaa? number the number of antialiasing samples
---@field stencil? boolean whether a stencil buffer should be allocated. If true, the stencil buffer will have 8 bits.
---@field depth? number the number of bits in the depth buffer
---@field resizable? boolean whether the window can be resized.
---@field borderless? boolean whether the window should be borderless.
---@field centered? boolean whether the window should be initially centered on the screen.
---@field display? number the index of the display to create the window in, if multiple monitors are available.
---@field minwidth? number the minimum width of the window. if it is resizable, cannot be less than 1.
---@field minheight? number the minimum height of the window. if it is resizable, cannot be less than 1.
---@field highdpi? boolean true if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays. This is always enabled on Android.
---@field x? number the x-coordinate of the window's position on the screen.
---@field y? number the y-coordinate of the window's position on the screen.
---@field usedpiscale? boolean disables love's automatic DIP scaling on high-DPI displays when false.
DisplayModeOptions = {
}
    ]],


}


--- types:
--- 1. table: used to map a table to a patched type
--- 2. overload: used to add additional overloads to a function
--- 3. base: used to specified a base type for a class
--- 4. deprecated: used to mark a function as deprecated, with an optional replacement
--- 5. remove: a function, class or field is removed
local patch = {
    {
        name = "DisplayModeOptions",
        description = "",
        definitios = "",
        type = "table",
        targets = {
            {
                module = "love.window",
                function_name = "setMode",
                argument = "flags",
                type = "DisplayModeOptions"
            },
            {
                module = "love.window",
                function_name = "getMode",
                return_name = "flags",
                type = "DisplayModeOptions"
            }
        }
    },


    {
        name = "Texture",
        type = "base",
        base_cls = "Drawable"
    },
    {
        name = "Canvas",
        type = "base",
        base_cls = "Texture"
    },

    {
        name = "love.filesystem.newFile",
        version = "12.0",
        type = "deprecated",
        module = "love.filesystem",
        function_name = "newFile",
        replacement = { "love.filesystem.openFile" }
    },
    {
        name = "love.math.noise",
        version = "12.0",
        type = "deprecated",
        module = "love.math",
        function_name = "noise",
        replacement = { "love.math.perlinNoise", "love.math.simplexNoise" }
    },
    {
        name = "love.event.wait",
        version = "12.0",
        type = "deprecated",
        module = "love.event",
        function_name = "wait",
        replacement = { "love.event.pump" }
    },
    {
        name = "love.physics.newFixture",
        version = "12.0",
        type = "deprecated",
        module = " love.physics",
        function_name = "newFixture",
    },
    {
        name = "Body:getFixtures",
        version = "12.0",
        type = "deprecated",
        module = "Body",
        function_name = "getFixtures",
        replacement = { "Body:getShapes" }
    },
    {
        name = "Contact:getFixtures",
        version = "12.0",
        type = "deprecated",
        module = "Contact",
        function_name = "getFixtures",
        replacement = { "Contact:getShapes" }
    },
    {
        name = "World:queryBoundingBox",
        version = "12.0",
        type = "deprecated",
        module = "World",
        function_name = "queryBoundingBox",
        replacement = { "World:queryShapesInArea" }
    },
    {
        name = "ChainShape:getChildEdge",
        version = "12.0",
        type = "deprecated",
        module = "ChainShape",
        function_name = "getChildEdge",
    },
    {
        name = "love.graphics.setNewFont",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "setNewFont",
        replacement = { "love.graphics.newFont", "love.graphics.setFon" }
    },
    {
        name = "love.graphics.newText",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "newText",
        replacement = { "love.graphics.newTextBatch" }
    },
    {
        name = "love.graphics.getImageFormats",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "getImageFormats",
        replacement = { "love.graphics.getTextureFormats" }
    },
    {
        name = "love.graphics.getCanvasFormats",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "getCanvasFormats",
        replacement = { "love.graphics.getTextureFormats" }
    },
    {
        name = "love.graphics.stenci",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "stenci",
        replacement = { "love.graphics.setStencilMode", "love.graphics.setStencilState" }
    },
    {
        name = "love.graphics.setStencilTest",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "setStencilTest",
        replacement = { "love.graphics.setStencilMode", "love.graphics.setStencilState" }
    },
    {
        name = "love.graphics.getStencilTest",
        version = "12.0",
        type = "deprecated",
        module = "love.graphics",
        function_name = "getStencilTest",
        replacement = { "love.graphics.getStencilMode", "love.graphics.getStencilState" }
    },
    {
        name = "love.window.close",
        version = "12.0",
        type = "deprecated",
        module = "love.window",
        function_name = "close",
    },
    {
        name = "LoveConfWindow.highdpi",
        version = "12.0",
        type = "deprecated",
        module = "LoveConfWindow",
        field_name = "highdpi",
        replacement = { "LoveConf.highdpi" }
    },
    {
        name = "DisplayModeOptions.highdpi",
        version = "12.0",
        type = "deprecated",
        module = "DisplayModeOptions",
        field_name = "highdpi",
        replacement = { "LoveConf.highdpi" }
    },
    {
        name = "Canvas:newImageData",
        version = "12.0",
        type = "deprecated",
        module = "Canvas",
        function_name = "newImageData",
        replacement = { "love.graphics.readbackTexture" }
    },

    {
        name = "LoveConf.accelerometerjoystick",
        version = "12.0",
        type = "remove",
        module = "LoveConf",
        field_name = "accelerometerjoystick"
    },
    {
        name = "Fixture",
        version = "12.0",
        type = "remove",
        module = "Fixture",
    },
    {
        name = "love.audio.getSourceCount",
        version = "12.0",
        type = "remove",
        module = "love.audio",
        function_name = "getSourceCount"
    },
    {
        name = "Source:getChannels",
        version = "12.0",
        type = "remove",
        module = "Source",
        function_name = "getChannels"
    },
    {
        name = "Decoder:getChannels",
        version = "12.0",
        type = "remove",
        module = "Decoder",
        function_name = "getChannels"
    },
    {
        name = "love.filesystem.isDirectory",
        version = "12.0",
        type = "remove",
        module = "love.filesystem",
        function_name = "isDirectory"
    },
    {
        name = "love.filesystem.isFile",
        version = "12.0",
        type = "remove",
        module = "love.filesystem",
        function_name = "isFile"
    },
    {
        name = "love.filesystem.isSymlink",
        version = "12.0",
        type = "remove",
        module = "love.filesystem",
        function_name = "isSymlink"
    },
    {
        name = "love.filesystem.getLastModified",
        version = "12.0",
        type = "remove",
        module = "love.filesystem",
        function_name = "getLastModified"
    },
    {
        name = "love.filesystem.getSize",
        version = "12.0",
        type = "remove",
        module = "love.filesystem",
        function_name = "getSize"
    },
    {
        name = "ParticleSystem:setAreaSpread",
        version = "12.0",
        type = "remove",
        module = "ParticleSystem",
        function_name = "setAreaSpread"
    },
    {
        name = "ParticleSystem:getAreaSpread",
        version = "12.0",
        type = "remove",
        module = "ParticleSystem",
        function_name = "getAreaSpread"
    },
    {
        name = "love.math.compress",
        version = "12.0",
        type = "remove",
        module = "love.math",
        function_name = "compress"
    },
    {
        name = "love.math.decompress",
        version = "12.0",
        type = "remove",
        module = "love.math",
        function_name = "decompress"
    },
    {
        name = "World:getBodyLists",
        version = "12.0",
        type = "remove",
        module = "World",
        function_name = "getBodyLists"
    },
    {
        name = "World:getBodyLists",
        version = "12.0",
        type = "remove",
        module = "World",
        function_name = "getJointList"
    },
    {
        name = "World:getContactList",
        version = "12.0",
        type = "remove",
        module = "World",
        function_name = "getContactList"
    },
    {
        name = "Body:getFixtureList",
        version = "12.0",
        type = "remove",
        module = "Body",
        function_name = "getFixtureList"
    },
    {
        name = "Body:getJointList",
        version = "12.0",
        type = "remove",
        module = "Body",
        function_name = "getJointList"
    },
    {
        name = "Body:getContactList",
        version = "12.0",
        type = "remove",
        module = "Body",
        function_name = "getContactList"
    },
    {
        name = "PrismaticJoint:hasLimitsEnabled",
        version = "12.0",
        type = "remove",
        module = "PrismaticJoint",
        function_name = "hasLimitsEnabled"
    },
    {
        name = "RevoluteJoint:hasLimitsEnabled",
        version = "12.0",
        type = "remove",
        module = "RevoluteJoint",
        function_name = "hasLimitsEnabled"
    },

    -- {
    --     name = "setDefaultFilter",
    --     description = "",
    --     type = "overload",
    --     module = "love.graphics",
    --     function_name = "setDefaultFilter",
    --     overloads = {
    --         {
    --             arguments = {
    --                 {
    --                     name = "min",
    --                     type = "FilterMode"
    --                 },
    --                 {
    --                     name = "mag",
    --                     type = "FilterMode"
    --                 },
    --             },
    --             returns = {}
    --         }
    --     }
    -- },

    -- {
    --     name = "setFilter",
    --     description = "",
    --     type = "overload",
    --     module = { "Texture", "Font", "Video" },
    --     function_name = "setFilter",
    --     overloads = {
    --         {
    --             arguments = {
    --                 {
    --                     name = "min",
    --                     type = "FilterMode"
    --                 },
    --                 {
    --                     name = "mag",
    --                     type = "FilterMode"
    --                 },
    --             },
    --             returns = {}
    --         }
    --     }
    -- },

    -- {
    --     name = "love.graphics.clear",
    --     description = "",
    --     type = "overload",
    --     module = "love.graphics",
    --     function_name = "clear",
    --     overloads = {
    --         {
    --             arguments = {
    --                 {
    --                     name = "r",
    --                     type = "number"
    --                 },
    --                 {
    --                     name = "g",
    --                     type = "number"
    --                 },
    --                 {
    --                     name = "b",
    --                     type = "number"
    --                 }
    --             }
    --         }
    --     }
    -- },

    -- {
    --     name = "love.graphics.print",
    --     description = "",
    --     type = "overload",
    --     module = "love.graphics",
    --     function_name = "print",
    --     overloads = {
    --         {
    --             arguments = {
    --                 {
    --                     name = "text",
    --                     type = "string"
    --                 },
    --                 {
    --                     name = "x",
    --                     type = "number"
    --                 },
    --                 {
    --                     name = "y",
    --                     type = "number"
    --                 },
    --             }
    --         }
    --     }
    -- }
}

local function genArgPatch(module_name, function_name, argument)
    for _, p in ipairs(patch) do
        if p.type == "table" then
            for _, t in ipairs(p.targets) do
                if t.function_name == function_name and t.module == module_name and t.argument == argument then
                    return t.type
                end
            end
        end
    end

    return nil
end

local function genReturnPatch(module_name, function_name, return_name)
    for _, p in ipairs(patch) do
        if p.type == "table" then
            for _, t in ipairs(p.targets) do
                if t.function_name == function_name and t.module == module_name and t.return_name == return_name then
                    return t.type
                end
            end
        end
    end

    return nil
end


local function getPatchBaseClass(cls_name)
    for _, p in ipairs(patch) do
        if p.type == "base" and p.name == cls_name then
            return p.base_cls
        end
    end

    return nil
end

local function genOverloadPatch(module_name, function_name)
    for _, p in ipairs(patch) do
        if p.type == "overload" and p.function_name == function_name then
            local modules = {}

            -- modules to patch
            if type(module_name) == "table" then
                for _, m in ipairs(module_name) do
                    table.insert(modules, m)
                end
            else
                table.insert(modules, module_name)
            end
            local code = ""

            for _, module in ipairs(modules) do
                if module == module_name then
                    for _, o in ipairs(p.overloads) do
                        code = code .. "---@overload fun("

                        for i, a in ipairs(o.arguments) do
                            if i == 1 then
                                code = code .. a.name .. ": " .. a.type
                            else
                                code = code .. ", " .. a.name .. ": " .. a.type
                            end
                        end

                        code = code .. ")"

                        if p.returns and #p.returns > 0 then
                            code = code .. ": "

                            for i, r in ipairs(p.returns) do
                                if i == 1 then
                                    code = code .. r.type
                                else
                                    code = code .. ", " .. r.type
                                end
                            end
                        end

                        code = code .. "\n"
                    end
                end
            end

            return code
        end
    end

    return nil
end

local function genDeprecatedPatch(module_name, function_name, field_name, version)
    assert(module_name ~= nil and (function_name ~= nil or field_name ~= nil),
        "module_name and function_name or field_name must be specified")

    local is_deprecated = false
    local deprecated_decleration = ""

    for _, p in ipairs(patch) do
        if p.type == "deprecated" and p.module == module_name and (p.version == nil or p.version == version) then
            local replacements = ""

            if p.replacement ~= nil then
                replacements = "replaced with: "

                replacements = replacements .. table.concat(p.replacement, ", ")
            end

            if function_name ~= nil and function_name == p.function_name then
                is_deprecated = true

                deprecated_decleration = "---@deprecated " .. replacements

                break
            else
                if field_name ~= nil and field_name == p.field_name then
                    is_deprecated = true

                    deprecated_decleration = "---@deprecated " .. replacements

                    break
                end
            end
        end
    end

    return is_deprecated, deprecated_decleration
end

local function isRemoved(module_name, function_name, field_name, version)
    for _, p in ipairs(patch) do
        if p.type == "remove" and p.module == module_name and (p.version == nil or p.version == version) then
            -- remove the function
            if function_name ~= nil and function_name == p.function_name then
                return true
            else
                -- remove the field
                if field_name ~= nil and field_name == p.field_name then
                    return true
                else
                    -- remove the module/type
                    if field_name == nil and p.field_name == nil then
                        return true
                    end
                end
            end
        end
    end

    return false
end

return {
    patch = patch,
    definitions = definitions,
    genArgPatch = genArgPatch,
    genReturnPatch = genReturnPatch,
    getPatchBaseClass = getPatchBaseClass,
    genOverloadPatch = genOverloadPatch,
    genDeprecatedPatch = genDeprecatedPatch,
    isRemoved = isRemoved
}
