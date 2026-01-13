---@meta love.touch

---@class love.touch
---Provides an interface to touch-screen presses.
local m = {}

---Gets the current position of the specified touch-press, in pixels.
---@param id lightuserdata @The identifier of the touch-press. Use love.touch.getTouches, love.touchpressed, or love.touchmoved to obtain touch id values.
---@return number x The position along the x-axis of the touch-press inside the window, in pixels.
---@return number y The position along the y-axis of the touch-press inside the window, in pixels.
function m.getPosition(id) end

---Gets the current pressure of the specified touch-press.
---@param id lightuserdata @The identifier of the touch-press. Use love.touch.getTouches, love.touchpressed, or love.touchmoved to obtain touch id values.
---@return number pressure The pressure of the touch-press. Most touch screens aren't pressure sensitive, in which case the pressure will be 1.
function m.getPressure(id) end

---Gets a list of all active touch-presses.
---@return table touches A list of active touch-press id values, which can be used with love.touch.getPosition.
function m.getTouches() end

return m