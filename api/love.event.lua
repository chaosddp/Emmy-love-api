--- @meta love.event


--- @class love.event
local m = {}


--- Arguments to love.event.push() and the like.
---
---Since 0.8.0, event names are no longer abbreviated.
--- @alias Event
---| 'focus' #Window focus gained or lost
---| 'joystickpressed' #Joystick pressed
---| 'joystickreleased' #Joystick released
---| 'keypressed' #Key pressed
---| 'keyreleased' #Key released
---| 'mousepressed' #Mouse pressed
---| 'mousereleased' #Mouse released
---| 'quit' #Quit
---| 'resize' #Window size changed by the user
---| 'visible' #Window is minimized or un-minimized by the user
---| 'mousefocus' #Window mouse focus gained or lost
---| 'threaderror' #A Lua error has occurred in a thread
---| 'joystickadded' #Joystick connected
---| 'joystickremoved' #Joystick disconnected
---| 'joystickaxis' #Joystick axis motion
---| 'joystickhat' #Joystick hat pressed
---| 'gamepadpressed' #Joystick's virtual gamepad button pressed
---| 'gamepadreleased' #Joystick's virtual gamepad button released
---| 'gamepadaxis' #Joystick's virtual gamepad axis moved
---| 'textinput' #User entered text
---| 'mousemoved' #Mouse position changed
---| 'lowmemory' #Running out of memory on mobile devices system
---| 'textedited' #Candidate text for an IME changed
---| 'wheelmoved' #Mouse wheel moved
---| 'touchpressed' #Touch screen touched
---| 'touchreleased' #Touch screen stop touching
---| 'touchmoved' #Touch press moved inside touch screen
---| 'directorydropped' #Directory is dragged and dropped onto the window
---| 'filedropped' #File is dragged and dropped onto the window.
---| 'jp' #Joystick pressed
---| 'jr' #Joystick released
---| 'kp' #Key pressed
---| 'kr' #Key released
---| 'mp' #Mouse pressed
---| 'mr' #Mouse released
---| 'q' #Quit
---| 'f' #Window focus gained or lost













return m