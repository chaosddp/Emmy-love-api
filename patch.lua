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


local patch = {
    {
        name = "DisplayModeOptions",
        description = "",
        definitios = "",
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
}

local function genArgPatch(module_name, function_name, argument)
    for _, p in ipairs(patch) do
        for _, t in ipairs(p.targets) do
            if t.function_name == function_name and t.argument == argument then
                return t.type
            end
        end
    end

    return nil
end

local function genReturnPatch(module_name, function_name, return_name) 
    for _, p in ipairs(patch) do
        for _, t in ipairs(p.targets) do
            if t.function_name == function_name and t.return_name == return_name then
                return t.type
            end
        end
    end

    return nil
end


return { patch = patch, definitions = definitions, genArgPatch = genArgPatch, genReturnPatch = genReturnPatch }
