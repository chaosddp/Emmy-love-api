---@meta love

---@class love
local m = {}

--region Data
---@class Data
---The superclass of all data.
local Data = {}
---Creates a new copy of the Data object.
---@return Data clone The new copy.
function Data:clone() end

---Gets an FFI pointer to the Data.
---
---This function should be preferred instead of Data:getPointer because the latter uses light userdata which can't store more all possible memory addresses on some new ARM64 architectures, when LuaJIT is used.
---@return cdata pointer A raw void* pointer to the Data, or nil if FFI is unavailable.
function Data:getFFIPointer() end

---Gets a pointer to the Data. Can be used with libraries such as LuaJIT's FFI.
---@return lightuserdata pointer A raw pointer to the Data.
function Data:getPointer() end

---Gets the Data's size in bytes.
---@return number size The size of the Data in bytes.
function Data:getSize() end

---Gets the full Data as a string.
---@return string data The raw data.
function Data:getString() end

--endregion Data
--region Object
---@class Object
---The superclass of all LÖVE types.
local Object = {}
---Destroys the object's Lua reference. The object will be completely deleted if it's not referenced by any other LÖVE object or thread.
---
---This method can be used to immediately clean up resources without waiting for Lua's garbage collector.
---@return boolean success True if the object was released by this call, false if it had been previously released.
function Object:release() end

---Gets the type of the object as a string.
---@return string type The type as a string.
function Object:type() end

---Checks whether an object is of a certain type. If the object has the type with the specified name in its hierarchy, this function will return true.
---@param name string @The name of the type to check for.
---@return boolean b True if the object is of the specified type, false otherwise.
function Object:typeOf(name) end

--endregion Object
---@type love.audio
m.audio = nil

---@type love.data
m.data = nil

---@type love.event
m.event = nil

---@type love.filesystem
m.filesystem = nil

---@type love.font
m.font = nil

---@type love.graphics
m.graphics = nil

---@type love.image
m.image = nil

---@type love.joystick
m.joystick = nil

---@type love.keyboard
m.keyboard = nil

---@type love.math
m.math = nil

---@type love.mouse
m.mouse = nil

---@type love.physics
m.physics = nil

---@type love.sound
m.sound = nil

---@type love.system
m.system = nil

---@type love.thread
m.thread = nil

---@type love.timer
m.timer = nil

---@type love.touch
m.touch = nil

---@type love.video
m.video = nil

---@type love.window
m.window = nil

---Gets the current running version of LÖVE.
---@return number major The major version of LÖVE, i.e. 0 for version 0.9.1.
---@return number minor The minor version of LÖVE, i.e. 9 for version 0.9.1.
---@return number revision The revision version of LÖVE, i.e. 1 for version 0.9.1.
---@return string codename The codename of the current version, i.e. 'Baby Inspector' for version 0.9.1.
function m.getVersion() end

---Gets whether LÖVE displays warnings when using deprecated functionality. It is disabled by default in fused mode, and enabled by default otherwise.
---
---When deprecation output is enabled, the first use of a formally deprecated LÖVE API will show a message at the bottom of the screen for a short time, and print the message to the console.
---@return boolean enabled Whether deprecation output is enabled.
function m.hasDeprecationOutput() end

---Gets whether the given version is compatible with the current running version of LÖVE.
---@param version string @The version to check (for example '11.3' or '0.10.2').
---@return boolean compatible Whether the given version is compatible with the current running version of LÖVE.
---@overload fun(major:number, minor:number, revision:number):boolean
function m.isVersionCompatible(version) end

---Sets whether LÖVE displays warnings when using deprecated functionality. It is disabled by default in fused mode, and enabled by default otherwise.
---
---When deprecation output is enabled, the first use of a formally deprecated LÖVE API will show a message at the bottom of the screen for a short time, and print the message to the console.
---@param enable boolean @Whether to enable or disable deprecation output.
function m.setDeprecationOutput(enable) end

-- callbacks 

---Module options.
---@class LoveConfModules
---@field audio? boolean @Enable the audio module.
---@field event? boolean @Enable the event module.
---@field graphics? boolean @Enable the graphics module.
---@field image? boolean @Enable the image module.
---@field joystick? boolean @Enable the joystick module.
---@field keyboard? boolean @Enable the keyboard module.
---@field math? boolean @Enable the math module.
---@field mouse? boolean @Enable the mouse module.
---@field physics? boolean @Enable the physics module.
---@field sound? boolean @Enable the sound module.
---@field system? boolean @Enable the system module.
---@field timer? boolean @Enable the timer module.
---@field touch? boolean @Enable the touch module.
---@field video? boolean @Enable the video module.
---@field window? boolean @Enable the window module.
---@field thread? boolean @Enable the thread module.
local loveconf_modules= {}

---It is possible to defer window creation until love.window.setMode is first called in your code. To do so, set t.window = nil in love.conf (or t.screen = nil in older versions.) If this is done, LÖVE may crash if any function from love.graphics is called before the first love.window.setMode in your code.
---
---The t.window table was named t.screen in versions prior to 0.9.0. The t.screen table doesn't exist in love.conf in 0.9.0, and the t.window table doesn't exist in love.conf in 0.8.0. This means love.conf will fail to execute (therefore it will fall back to default values) if care is not taken to use the correct table for the LÖVE version being used.
---@class LoveConfWindow
---@field title? string @Sets the title of the window the game is in. Alternatively love.window.setTitle can be used to change the window title outside of the config file.
---@field icon? string @A filepath to an image to use as the window's icon. Not all operating systems support very large icon images. The icon can also be changed with love.window.setIcon.
---@field width? number @Sets the window's dimensions. If these flags are set to 0 LÖVE automatically uses the user's desktop dimensions.
---@field height? number @Sets the window's dimensions. If these flags are set to 0 LÖVE automatically uses the user's desktop dimensions.
---@field borderless? boolean @Removes all border visuals from the window. Note that the effects may wary between operating systems.
---@field resizable? boolean @If set to true this allows the user to resize the game's window.
---@field minwidth? number @Sets the minimum width and height for the game's window if it can be resized by the user. If you set lower values to window.width and window.height LÖVE will always favor the minimum dimensions set via window.minwidth and window.minheight.
---@field minheight? number @Sets the minimum width and height for the game's window if it can be resized by the user. If you set lower values to window.width and window.height LÖVE will always favor the minimum dimensions set via window.minwidth and window.minheight.
---@field fullscreen? boolean @Whether to run the game in fullscreen (true) or windowed (false) mode. The fullscreen can also be toggled via love.window.setFullscreen or love.window.setMode.
---@field fullscreentype? string @Specifies the type of fullscreen mode to use (normal or desktop). Generally the desktop is recommended, as it is less restrictive than normal mode on some operating systems.
---@field usedpiscale? boolean @Sets whetever to enable or disable automatic DPI scaling.
---@field vsync? number @Enables or deactivates vertical synchronization. Vsync tries to keep the game at a steady framerate and can prevent issues like screen tearing. It is recommended to keep vsync activated if you don't know about the possible implications of turning it off. Before LÖVE 11.0, this value was boolean (true or false). Since LÖVE 11.0, this value is number (1 to enable vsync, 0 to disable vsync, -1 to use adaptive vsync when supported).
---
---Note that in iOS, vertical synchronization is always enabled and cannot be changed.
---@field depth? number @The number of bits per sample in the depth buffer (16/24/32, default nil)
---@field stencil? number @Then number of bits per sample in the depth buffer (generally 8, default nil)
---@field msaa? number @The number of samples to use with multi-sampled antialiasing.
---@field display? number @The index of the display to show the window in, if multiple monitors are available.
---@field highdpi? boolean @See love.window.getPixelScale, love.window.toPixels, and love.window.fromPixels. It is recommended to keep this option disabled if you can't test your game on a Mac or iOS system with a Retina display, because code will need tweaking to make sure things look correct.
---@field x? number @Determines the position of the window on the user's screen. Alternatively love.window.setPosition can be used to change the position on the fly.
---@field y? number @Determines the position of the window on the user's screen. Alternatively love.window.setPosition can be used to change the position on the fly.
local loveconf_window= {}

---Audio options.
---@class LoveConfAudio
---@field mic? boolean @Request microphone permission from the user. When user allows it, love.audio.getRecordingDevices will lists recording devices available. Otherwise, love.audio.getRecordingDevices returns empty table and a message is shown to inform user when called.
---@field mixwithsystem? boolean @Sets whether background audio / music from other apps should play while LÖVE is open. See love.system.hasBackgroundMusic for more details.
local loveconf_audio= {}

---The love.conf function takes one argument: a table filled with all the default values which you can overwrite to your liking. If you want to change the default window size, for instance, do:
---
---function love.conf(t)
---    t.window.width = 1024
---    t.window.height = 768
---end
---
---If you don't need the physics module or joystick module, do the following.
---
---function love.conf(t)
---    t.modules.joystick = false
---    t.modules.physics = false
---end
---
---Setting unused modules to false is encouraged when you release your game. It reduces startup time slightly (especially if the joystick module is disabled) and reduces memory usage (slightly).
---
---Note that you can't disable love.filesystem; it's mandatory. The same goes for the love module itself. love.graphics needs love.window to be enabled.
---@class LoveConf
---@field identity? string @This flag determines the name of the save directory for your game. Note that you can only specify the name, not the location where it will be created:
---t.identity = "gabe_HL3" -- Correct
---
---t.identity = "c:/Users/gabe/HL3" -- Incorrect
---Alternatively love.filesystem.setIdentity can be used to set the save directory outside of the config file.
---@field appendidentity? boolean @This flag determines if game directory should be searched first then save directory (true) or otherwise (false)
---@field version? string @t.version should be a string, representing the version of LÖVE for which your game was made. It should be formatted as "X.Y.Z" where X is the major release number, Y the minor, and Z the patch level. It allows LÖVE to display a warning if it isn't compatible. Its default is the version of LÖVE running.
---@field console? boolean @Determines whether a console should be opened alongside the game window (Windows only) or not. Note: On OSX you can get console output by running LÖVE through the terminal.
---@field accelerometerjoystick? boolean @Sets whether the device accelerometer on iOS and Android should be exposed as a 3-axis Joystick. Disabling the accelerometer when it's not used may reduce CPU usage.
---@field externalstorage? boolean @Sets whether files are saved in external storage (true) or internal storage (false) on Android.
---@field gammacorrect? boolean @Determines whether gamma-correct rendering is enabled, when the system supports it.
---@field audio? LoveConfAudio @Audio options.
---@field window? LoveConfWindow @It is possible to defer window creation until love.window.setMode is first called in your code. To do so, set t.window = nil in love.conf (or t.screen = nil in older versions.) If this is done, LÖVE may crash if any function from love.graphics is called before the first love.window.setMode in your code.
---
---The t.window table was named t.screen in versions prior to 0.9.0. The t.screen table doesn't exist in love.conf in 0.9.0, and the t.window table doesn't exist in love.conf in 0.8.0. This means love.conf will fail to execute (therefore it will fall back to default values) if care is not taken to use the correct table for the LÖVE version being used.
---@field modules? LoveConfModules @Module options.
local love_conf= {}


---If a file called conf.lua is present in your game folder (or .love file), it is run before the LÖVE modules are loaded. You can use this file to overwrite the love.conf function, which is later called by the LÖVE 'boot' script. Using the love.conf function, you can set some configuration options, and change things like the default size of the window, which modules are loaded, and other stuff.
---@type fun(t:LoveConf)
m.conf = nil

---Callback function triggered when a directory is dragged and dropped onto the window.
---@type fun(path:string)
m.directorydropped = nil

---Called when the device display orientation changed, for example, user rotated their phone 180 degrees.
---@type fun(index:number, orientation:DisplayOrientation)
m.displayrotated = nil

---Callback function used to draw on the screen every frame.
---@type fun()
m.draw = nil

---The error handler, used to display error messages.
---@type fun(msg:string)
m.errorhandler = nil

---Callback function triggered when a file is dragged and dropped onto the window.
---@type fun(file:DroppedFile)
m.filedropped = nil

---Callback function triggered when window receives or loses focus.
---@type fun(focus:boolean)
m.focus = nil

---Called when a Joystick's virtual gamepad axis is moved.
---@type fun(joystick:Joystick, axis:GamepadAxis, value:number)
m.gamepadaxis = nil

---Called when a Joystick's virtual gamepad button is pressed.
---@type fun(joystick:Joystick, button:GamepadButton)
m.gamepadpressed = nil

---Called when a Joystick's virtual gamepad button is released.
---@type fun(joystick:Joystick, button:GamepadButton)
m.gamepadreleased = nil

---Called when a Joystick is connected.
---@type fun(joystick:Joystick)
m.joystickadded = nil

---Called when a joystick axis moves.
---@type fun(joystick:Joystick, axis:number, value:number)
m.joystickaxis = nil

---Called when a joystick hat direction changes.
---@type fun(joystick:Joystick, hat:number, direction:JoystickHat)
m.joystickhat = nil

---Called when a joystick button is pressed.
---@type fun(joystick:Joystick, button:number)
m.joystickpressed = nil

---Called when a joystick button is released.
---@type fun(joystick:Joystick, button:number)
m.joystickreleased = nil

---Called when a Joystick is disconnected.
---@type fun(joystick:Joystick)
m.joystickremoved = nil

---Callback function triggered when a key is pressed.
---@type fun(key:KeyConstant, scancode:Scancode, isrepeat:boolean)
m.keypressed = nil

---Callback function triggered when a keyboard key is released.
---@type fun(key:KeyConstant, scancode:Scancode)
m.keyreleased = nil

---This function is called exactly once at the beginning of the game.
---@type fun(arg:table, unfilteredArg:table)
m.load = nil

---Callback function triggered when the system is running out of memory on mobile devices.
---
---Mobile operating systems may forcefully kill the game if it uses too much memory, so any non-critical resource should be removed if possible (by setting all variables referencing the resources to '''nil'''), when this event is triggered. Sounds and images in particular tend to use the most memory.
---@type fun()
m.lowmemory = nil

---Callback function triggered when window receives or loses mouse focus.
---@type fun(focus:boolean)
m.mousefocus = nil

---Callback function triggered when the mouse is moved.
---@type fun(x:number, y:number, dx:number, dy:number, istouch:boolean)
m.mousemoved = nil

---Callback function triggered when a mouse button is pressed.
---@type fun(x:number, y:number, button:number, istouch:boolean, presses:number)
m.mousepressed = nil

---Callback function triggered when a mouse button is released.
---@type fun(x:number, y:number, button:number, istouch:boolean, presses:number)
m.mousereleased = nil

---Callback function triggered when the game is closed.
---@type fun()
m.quit = nil

---Called when the window is resized, for example if the user resizes the window, or if love.window.setMode is called with an unsupported width or height in fullscreen and the window chooses the closest appropriate size.
---@type fun(w:number, h:number)
m.resize = nil

---The main function, containing the main loop. A sensible default is used when left out.
---@type fun()
m.run = nil

---Called when the candidate text for an IME (Input Method Editor) has changed.
---
---The candidate text is not the final text that the user will eventually choose. Use love.textinput for that.
---@type fun(text:string, start:number, length:number)
m.textedited = nil

---Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text '@' will be generated.
---@type fun(text:string)
m.textinput = nil

---Callback function triggered when a Thread encounters an error.
---@type fun(thread:Thread, errorstr:string)
m.threaderror = nil

---Callback function triggered when a touch press moves inside the touch screen.
---@type fun(id:lightuserdata, x:number, y:number, dx:number, dy:number, pressure:number)
m.touchmoved = nil

---Callback function triggered when the touch screen is touched.
---@type fun(id:lightuserdata, x:number, y:number, dx:number, dy:number, pressure:number)
m.touchpressed = nil

---Callback function triggered when the touch screen stops being touched.
---@type fun(id:lightuserdata, x:number, y:number, dx:number, dy:number, pressure:number)
m.touchreleased = nil

---Callback function used to update the state of the game every frame.
---@type fun(dt:number)
m.update = nil

---Callback function triggered when window is minimized/hidden or unminimized by the user.
---@type fun(visible:boolean)
m.visible = nil

---Callback function triggered when the mouse wheel is moved.
---@type fun(x:number, y:number)
m.wheelmoved = nil

return m