---Checks whether a modifier key is active.
---
---Example of modifier keys are caps lock, num lock, and scroll lock while also have press/release state, additionally also have active state.
---@param modifier ModifierKey Modifier key to check.
---@return boolean active Wheter the specified modifier key is active or not.
function m.isModifierActive(modifier) end

---Modifier keys are keys that have "active" state in addition of pressed/released state, thus modifier keys are small subset of KeyConstant.
---@alias ModifierKey
---| 'capslock'	#Caps lock.
---| 'numlock'	#Num lock.
---| 'scrolllock'	#Scroll lock.
---| 'mode' Mode key.
