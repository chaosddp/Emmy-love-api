---Gets whether the specified sensor exists in the Joystick.
---@param sensorType SensorType
---@return boolean
function Joystick:hasSensor(sensorType) end

---Enables or disables the specified sensor on this Joystick.
---
---The given sensor type must exist on this Joystick, otherwise this function may cause an error.
---@param sensorType SensorType Type of sensor to enable or disable.
---@param enable boolean True to enable the given sensor, false to disable it.
function Joystick:setSensorEnabled(sensorType, enable) end

---Gets whether the specified sensor is currently enabled on this Joystick.
---@param sensorType SensorType Type of sensor to check.
---@return boolean enabled Whether the sensor is currently enabled.
function Joystick:isSensorEnabled(sensorType) end

---Gets the latest data for the given sensor type for this Joystick.
---
---The returned values have meaning based on the sensor type, for example an accelerometer will return acceleration values along each axis.
---
---If the sensor was not enabled via Joystick:setSensorEnabled, this function may cause an error.
---@param sensorType SensorType Type of sensor to get data from.
---@return number x The sensor's current 1st value
---@return number y The sensor's current 2nd value
---@return number z The sensor's current 3rd value
function Joystick:getSensorData(sensorType) end

---Sets the player index of this Joystick. This corresponds to an indicator light on many common gamepads.
---
---Note that this is independent from the array index of this Joystick in the table returned by love.joystick.getJoysticks.
---@param index number The 1-based player index to use for this Joystick. 0 clears the set index.
function Joystick:setPlayerIndex(index) end

---Gets the player index of this Joystick. This corresponds to an indicator light on many common gamepads.
---
---Note that this is independent from the array index of this Joystick in the table returned by love.joystick.getJoysticks.
---@return number index The 1-based player index being used for this Joystick, or -1 if the player index has not been set or cannot be determined.
function Joystick:getPlayerIndex() end

---Gets the JoystickType of the Joystick.
---
---JoystickTypes are broader categories than GamepadTypes.
---@return JoystickType joysticktype The type of the joystick, or "unknown" if it can't be determined.
function Joystick:getJoystickType() end

---Gets the GamepadType of the Joystick, if it's recognized as a gamepad.
---@return GamepadType gamepadtype The type of the joystick, or "unknown" if it can't be determined.
function Joystick:getGamepadType() end

---@alias GamepadType
---| "unknown" An unrecognized gamepad type.
---| "xbox360" Xbox 360 controller.
---| "xboxone" Xbox One controller.
---| "ps3" PlayStation 3 controller.
---| "ps4" PlayStation 4 controller.
---| "ps5" PlayStation 5 controller.
---| "switchpro" Nintendo Switch Pro controller."
---| "amazonluna" Amazon Luna controller.
---| "stadia" Google Stadia controller.
---| "virtual" Software-based gamepad whose state is set programmatically.
---| "shield" nvidia Shield controller.
---| "joyconleft" Left-hand joycon (Nintendo Switch).
---| "joyconright" Right-hand joycon (Nintendo Switch).
---| "joyconpair" Both left- and right-hand joycons together(Nintendo Switch).



---@alias JoystickType
---| "unknown" An unrecognized joystick type.
---| "gamepad" A gamepad.
---| "wheel" Steering / racing wheel.
---| "arcadestick" Fighting game arcade stick.
---| "flightstick" HOTAS / flight stick.
---| "dancepad" Dance pad.
---| "guitar" Guitar.
---| "drumkit" Drum kit.
---| "arcadepad" Arcade pad.
---| "throttle" Standalone throttle.
