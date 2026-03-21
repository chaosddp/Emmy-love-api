--- @meta love.window


--- @class love.window
local m = {}


--- Types of device display orientation.
--- @alias DisplayOrientation
---| 'unknown' #Orientation cannot be determined.
---| 'landscape' #Landscape orientation.
---| 'landscapeflipped' #Landscape orientation (flipped).
---| 'portrait' #Portrait orientation.
---| 'portraitflipped' #Portrait orientation (flipped).


--- Types of fullscreen modes.
--- @alias FullscreenType
---| 'desktop' #Sometimes known as borderless fullscreen windowed mode. A borderless screen-sized window is created which sits on top of all desktop UI elements. The window is automatically resized to match the dimensions of the desktop, and its size cannot be changed.
---| 'exclusive' #Standard exclusive-fullscreen mode. Changes the display mode (actual resolution) of the monitor.
---| 'normal' #Standard exclusive-fullscreen mode. Changes the display mode (actual resolution) of the monitor.


--- Types of message box dialogs. Different types may have slightly different looks.
--- @alias MessageBoxType
---| 'info' #Informational dialog.
---| 'warning' #Warning dialog.
---| 'error' #Error dialog.













return m