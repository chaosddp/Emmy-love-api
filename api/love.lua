--- @meta love


--- @class love
local m = {}








--- @class Conf
--- @field identity? string @This flag determines the name of the save directory for your game. Note that you can only specify the name, not the location where it will be created:
---t.identity = "gabe_HL3" -- Correct
---
---t.identity = "c:/Users/gabe/HL3" -- Incorrect
---Alternatively love.filesystem.setIdentity can be used to set the save directory outside of the config file., default is nil
--- @field appendidentity? boolean @This flag determines if game directory should be searched first then save directory (true) or otherwise (false), default is false
--- @field version? string @t.version should be a string, representing the version of LÖVE for which your game was made. It should be formatted as "X.Y.Z" where X is the major release number, Y the minor, and Z the patch level. It allows LÖVE to display a warning if it isn't compatible. Its default is the version of LÖVE running., default is "11.5"
--- @field console? boolean @Determines whether a console should be opened alongside the game window (Windows only) or not. Note: On OSX you can get console output by running LÖVE through the terminal., default is false
--- @field accelerometerjoystick? boolean @Sets whether the device accelerometer on iOS and Android should be exposed as a 3-axis Joystick. Disabling the accelerometer when it's not used may reduce CPU usage., default is true
--- @field externalstorage? boolean @Sets whether files are saved in external storage (true) or internal storage (false) on Android., default is false
--- @field gammacorrect? boolean @Determines whether gamma-correct rendering is enabled, when the system supports it., default is false
--- @field audio? ConfAudio @Audio options., default is nil
--- @field window? ConfWindow @It is possible to defer window creation until love.window.setMode is first called in your code. To do so, set t.window = nil in love.conf (or t.screen = nil in older versions.) If this is done, LÖVE may crash if any function from love.graphics is called before the first love.window.setMode in your code.
---
---The t.window table was named t.screen in versions prior to 0.9.0. The t.screen table doesn't exist in love.conf in 0.9.0, and the t.window table doesn't exist in love.conf in 0.8.0. This means love.conf will fail to execute (therefore it will fall back to default values) if care is not taken to use the correct table for the LÖVE version being used., default is nil
--- @field modules? ConfModules @Module options., default is nil

--- @class ConfAudio
--- @field mic? boolean @Request microphone permission from the user. When user allows it, love.audio.getRecordingDevices will lists recording devices available. Otherwise, love.audio.getRecordingDevices returns empty table and a message is shown to inform user when called., default is false
--- @field mixwithsystem? boolean @Sets whether background audio / music from other apps should play while LÖVE is open. See love.system.hasBackgroundMusic for more details., default is true

--- @class ConfWindow
--- @field title? string @Sets the title of the window the game is in. Alternatively love.window.setTitle can be used to change the window title outside of the config file., default is "Untitled"
--- @field icon? string @A filepath to an image to use as the window's icon. Not all operating systems support very large icon images. The icon can also be changed with love.window.setIcon., default is nil
--- @field width? number @Sets the window's dimensions. If these flags are set to 0 LÖVE automatically uses the user's desktop dimensions., default is 800
--- @field height? number @Sets the window's dimensions. If these flags are set to 0 LÖVE automatically uses the user's desktop dimensions., default is 600
--- @field borderless? boolean @Removes all border visuals from the window. Note that the effects may wary between operating systems., default is false
--- @field resizable? boolean @If set to true this allows the user to resize the game's window., default is false
--- @field minwidth? number @Sets the minimum width and height for the game's window if it can be resized by the user. If you set lower values to window.width and window.height LÖVE will always favor the minimum dimensions set via window.minwidth and window.minheight., default is 1
--- @field minheight? number @Sets the minimum width and height for the game's window if it can be resized by the user. If you set lower values to window.width and window.height LÖVE will always favor the minimum dimensions set via window.minwidth and window.minheight., default is 1
--- @field fullscreen? boolean @Whether to run the game in fullscreen (true) or windowed (false) mode. The fullscreen can also be toggled via love.window.setFullscreen or love.window.setMode., default is false
--- @field fullscreentype? string @Specifies the type of fullscreen mode to use (normal or desktop). Generally the desktop is recommended, as it is less restrictive than normal mode on some operating systems., default is "desktop"
--- @field usedpiscale? boolean @Sets whetever to enable or disable automatic DPI scaling., default is true
--- @field vsync? number @Enables or deactivates vertical synchronization. Vsync tries to keep the game at a steady framerate and can prevent issues like screen tearing. It is recommended to keep vsync activated if you don't know about the possible implications of turning it off. Before LÖVE 11.0, this value was boolean (true or false). Since LÖVE 11.0, this value is number (1 to enable vsync, 0 to disable vsync, -1 to use adaptive vsync when supported).
---
---Note that in iOS, vertical synchronization is always enabled and cannot be changed., default is true
--- @field depth? number @The number of bits per sample in the depth buffer (16/24/32, default nil), default is nil
--- @field stencil? number @Then number of bits per sample in the depth buffer (generally 8, default nil), default is nil
--- @field msaa? number @The number of samples to use with multi-sampled antialiasing., default is 0
--- @field display? number @The index of the display to show the window in, if multiple monitors are available., default is 1
--- @field highdpi? boolean @See love.window.getPixelScale, love.window.toPixels, and love.window.fromPixels. It is recommended to keep this option disabled if you can't test your game on a Mac or iOS system with a Retina display, because code will need tweaking to make sure things look correct., default is false
--- @field x? number @Determines the position of the window on the user's screen. Alternatively love.window.setPosition can be used to change the position on the fly., default is nil
--- @field y? number @Determines the position of the window on the user's screen. Alternatively love.window.setPosition can be used to change the position on the fly., default is nil

--- @class ConfModules
--- @field audio? boolean @Enable the audio module., default is true
--- @field event? boolean @Enable the event module., default is true
--- @field graphics? boolean @Enable the graphics module., default is true
--- @field image? boolean @Enable the image module., default is true
--- @field joystick? boolean @Enable the joystick module., default is true
--- @field keyboard? boolean @Enable the keyboard module., default is true
--- @field math? boolean @Enable the math module., default is true
--- @field mouse? boolean @Enable the mouse module., default is true
--- @field physics? boolean @Enable the physics module., default is true
--- @field sound? boolean @Enable the sound module., default is true
--- @field system? boolean @Enable the system module., default is true
--- @field timer? boolean @Enable the timer module., default is true
--- @field touch? boolean @Enable the touch module., default is true
--- @field video? boolean @Enable the video module., default is true
--- @field window? boolean @Enable the window module., default is true
--- @field thread? boolean @Enable the thread module., default is true

--- If a file called conf.lua is present in your game folder (or .love file), it is run before the LÖVE modules are loaded. You can use this file to overwrite the love.conf function, which is later called by the LÖVE 'boot' script. Using the love.conf function, you can set some configuration options, and change things like the default size of the window, which modules are loaded, and other stuff.
--- @type fun(t: Conf):void
m.conf = nil


--- Callback function triggered when a directory is dragged and dropped onto the window.
--- @type fun(path: string):void
m.directorydropped = nil


--- Called when the device display orientation changed, for example, user rotated their phone 180 degrees.
--- @type fun(index: number, orientation: DisplayOrientation):void
m.displayrotated = nil


--- Callback function used to draw on the screen every frame.
--- @type fun():void
m.draw = nil


--- The error handler, used to display error messages.
--- @type fun(msg: string):void
m.errorhandler = nil


--- Callback function triggered when a file is dragged and dropped onto the window.
--- @type fun(file: DroppedFile):void
m.filedropped = nil


--- Callback function triggered when window receives or loses focus.
--- @type fun(focus: boolean):void
m.focus = nil


--- Called when a Joystick's virtual gamepad axis is moved.
--- @type fun(joystick: Joystick, axis: GamepadAxis, value: number):void
m.gamepadaxis = nil


--- Called when a Joystick's virtual gamepad button is pressed.
--- @type fun(joystick: Joystick, button: GamepadButton):void
m.gamepadpressed = nil


--- Called when a Joystick's virtual gamepad button is released.
--- @type fun(joystick: Joystick, button: GamepadButton):void
m.gamepadreleased = nil


--- Called when a Joystick is connected.
--- @type fun(joystick: Joystick):void
m.joystickadded = nil


--- Called when a joystick axis moves.
--- @type fun(joystick: Joystick, axis: number, value: number):void
m.joystickaxis = nil


--- Called when a joystick hat direction changes.
--- @type fun(joystick: Joystick, hat: number, direction: JoystickHat):void
m.joystickhat = nil


--- Called when a joystick button is pressed.
--- @type fun(joystick: Joystick, button: number):void
m.joystickpressed = nil


--- Called when a joystick button is released.
--- @type fun(joystick: Joystick, button: number):void
m.joystickreleased = nil


--- Called when a Joystick is disconnected.
--- @type fun(joystick: Joystick):void
m.joystickremoved = nil


--- Callback function triggered when a key is pressed.
--- @type fun(key: KeyConstant, scancode: Scancode, isrepeat: boolean):void
m.keypressed = nil


--- Callback function triggered when a keyboard key is released.
--- @type fun(key: KeyConstant, scancode: Scancode):void
m.keyreleased = nil


--- This function is called exactly once at the beginning of the game.
--- @type fun(arg: table, unfilteredArg: table):void
m.load = nil


--- Callback function triggered when the system is running out of memory on mobile devices.
---
---Mobile operating systems may forcefully kill the game if it uses too much memory, so any non-critical resource should be removed if possible (by setting all variables referencing the resources to '''nil'''), when this event is triggered. Sounds and images in particular tend to use the most memory.
--- @type fun():void
m.lowmemory = nil


--- Callback function triggered when window receives or loses mouse focus.
--- @type fun(focus: boolean):void
m.mousefocus = nil


--- Callback function triggered when the mouse is moved.
--- @type fun(x: number, y: number, dx: number, dy: number, istouch: boolean):void
m.mousemoved = nil


--- Callback function triggered when a mouse button is pressed.
--- @type fun(x: number, y: number, button: number, istouch: boolean, presses: number):void
m.mousepressed = nil


--- Callback function triggered when a mouse button is released.
--- @type fun(x: number, y: number, button: number, istouch: boolean, presses: number):void
m.mousereleased = nil


--- Callback function triggered when the game is closed.
--- @type fun():void
m.quit = nil


--- Called when the window is resized, for example if the user resizes the window, or if love.window.setMode is called with an unsupported width or height in fullscreen and the window chooses the closest appropriate size.
--- @type fun(w: number, h: number):void
m.resize = nil


--- The main function, containing the main loop. A sensible default is used when left out.
--- @type fun():void
m.run = nil


--- Called when the candidate text for an IME (Input Method Editor) has changed.
---
---The candidate text is not the final text that the user will eventually choose. Use love.textinput for that.
--- @type fun(text: string, start: number, length: number):void
m.textedited = nil


--- Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text '@' will be generated.
--- @type fun(text: string):void
m.textinput = nil


--- Callback function triggered when a Thread encounters an error.
--- @type fun(thread: Thread, errorstr: string):void
m.threaderror = nil


--- Callback function triggered when a touch press moves inside the touch screen.
--- @type fun(id: light userdata, x: number, y: number, dx: number, dy: number, pressure: number):void
m.touchmoved = nil


--- Callback function triggered when the touch screen is touched.
--- @type fun(id: light userdata, x: number, y: number, dx: number, dy: number, pressure: number):void
m.touchpressed = nil


--- Callback function triggered when the touch screen stops being touched.
--- @type fun(id: light userdata, x: number, y: number, dx: number, dy: number, pressure: number):void
m.touchreleased = nil


--- Callback function used to update the state of the game every frame.
--- @type fun(dt: number):void
m.update = nil


--- Callback function triggered when window is minimized/hidden or unminimized by the user.
--- @type fun(visible: boolean):void
m.visible = nil


--- Callback function triggered when the mouse wheel is moved.
--- @type fun(x: number, y: number):void
m.wheelmoved = nil





return m