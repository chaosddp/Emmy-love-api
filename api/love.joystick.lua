--- @meta love.joystick


--- @class love.joystick
local m = {}


--- Virtual gamepad axes.
--- @alias GamepadAxis
---| 'leftx' #The x-axis of the left thumbstick.
---| 'lefty' #The y-axis of the left thumbstick.
---| 'rightx' #The x-axis of the right thumbstick.
---| 'righty' #The y-axis of the right thumbstick.
---| 'triggerleft' #Left analog trigger.
---| 'triggerright' #Right analog trigger.


--- Virtual gamepad buttons.
--- @alias GamepadButton
---| 'a' #Bottom face button (A).
---| 'b' #Right face button (B).
---| 'x' #Left face button (X).
---| 'y' #Top face button (Y).
---| 'back' #Back button.
---| 'guide' #Guide button.
---| 'start' #Start button.
---| 'leftstick' #Left stick click button.
---| 'rightstick' #Right stick click button.
---| 'leftshoulder' #Left bumper.
---| 'rightshoulder' #Right bumper.
---| 'dpup' #D-pad up.
---| 'dpdown' #D-pad down.
---| 'dpleft' #D-pad left.
---| 'dpright' #D-pad right.


--- Joystick hat positions.
--- @alias JoystickHat
---| 'c' #Centered
---| 'd' #Down
---| 'l' #Left
---| 'ld' #Left+Down
---| 'lu' #Left+Up
---| 'r' #Right
---| 'rd' #Right+Down
---| 'ru' #Right+Up
---| 'u' #Up


--- Types of Joystick inputs.
--- @alias JoystickInputType
---| 'axis' #Analog axis.
---| 'button' #Button.
---| 'hat' #8-direction hat value.










--- Gets the full gamepad mapping string of the Joysticks which have the given GUID, or nil if the GUID isn't recognized as a gamepad.
---
---The mapping string contains binding information used to map the Joystick's buttons an axes to the standard gamepad layout, and can be used later with love.joystick.loadGamepadMappings.
--- Gets the full gamepad mapping string of the Joysticks which have the given GUID, or nil if the GUID isn't recognized as a gamepad.
---
---The mapping string contains binding information used to map the Joystick's buttons an axes to the standard gamepad layout, and can be used later with love.joystick.loadGamepadMappings.
--- @param guid string @The GUID value to get the mapping string for.
--- @return string @A string containing the Joystick's gamepad mappings, or nil if the GUID is not recognized as a gamepad.
function m.getGamepadMappingString(guid) end


--- Gets the number of connected joysticks.
--- Gets the number of connected joysticks.
--- @return number @The number of connected joysticks.
function m.getJoystickCount() end


--- Gets a list of connected Joysticks.
--- Gets a list of connected Joysticks.
--- @return table @The list of currently connected Joysticks.
function m.getJoysticks() end


--- Loads a gamepad mappings string or file created with love.joystick.saveGamepadMappings.
---
---It also recognizes any SDL gamecontroller mapping string, such as those created with Steam's Big Picture controller configure interface, or this nice database. If a new mapping is loaded for an already known controller GUID, the later version will overwrite the one currently loaded.
--- Loads a gamepad mappings string or file created with love.joystick.saveGamepadMappings.
---
---It also recognizes any SDL gamecontroller mapping string, such as those created with Steam's Big Picture controller configure interface, or this nice database. If a new mapping is loaded for an already known controller GUID, the later version will overwrite the one currently loaded.
--- @param filename string @The filename to load the mappings string from.
--- @overload fun(mappings: string):
function m.loadGamepadMappings(filename) end


--- Saves the virtual gamepad mappings of all recognized as gamepads and have either been recently used or their gamepad bindings have been modified.
---
---The mappings are stored as a string for use with love.joystick.loadGamepadMappings.
--- Saves the virtual gamepad mappings of all recognized as gamepads and have either been recently used or their gamepad bindings have been modified.
---
---The mappings are stored as a string for use with love.joystick.loadGamepadMappings.
--- @param filename string @The filename to save the mappings string to.
--- @return string @The mappings string that was written to the file.
--- @overload fun():
function m.saveGamepadMappings(filename) end


--- Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for ''all'' Dualshock 3 controllers used with the game when run in OS X.
---
---LÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren't recognized as gamepads by default.
---
---The virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.
--- Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for ''all'' Dualshock 3 controllers used with the game when run in OS X.
---
---LÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren't recognized as gamepads by default.
---
---The virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.
--- @param guid string @The OS-dependent GUID for the type of Joystick the binding will affect.
--- @param button GamepadButton @The virtual gamepad button to bind.
--- @param inputtype JoystickInputType @The type of input to bind the virtual gamepad button to.
--- @param inputindex number @The index of the axis, button, or hat to bind the virtual gamepad button to.
--- @param hatdir JoystickHat @The direction of the hat, if the virtual gamepad button will be bound to a hat. nil otherwise.
--- @return boolean @Whether the virtual gamepad button was successfully bound.
--- @overload fun(guid: string, axis: GamepadAxis, inputtype: JoystickInputType, inputindex: number, hatdir: JoystickHat):boolean
function m.setGamepadMapping(guid, button, inputtype, inputindex, hatdir) end







return m