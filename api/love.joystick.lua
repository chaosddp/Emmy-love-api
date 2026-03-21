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













return m