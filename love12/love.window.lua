---Brings the window into the foreground above other windows and sets input focus.
---
---This may not be functional on all platforms.
function m.focus() end

---Gets a pointer to the window's low level internal object. Currently this is a SDL_Window pointer.
---@return lightuserdata pointer A pointer to the window's SDL_Window object.
function m.getPointer() end

---Open system file dialog capable of picking files and folder.
---@param type FileDialogType File dialog type.
---@param callback ShowDialogCallback with 3 parameters: files (array of full platform-dependent paths to selected files, empty if the dialog is canceled by the user), filtername (nil if not set), and errorstring (nil if no error)
---@param settings FileDialogSettings
function m.showFileDialog(type, callback, settings) end

---@alias ShowDialogCallback fun(files: string[], filtername: table|nil, errorstring: string|nil):void

---Possible types of file dialogs.
---@alias FileDialogType
---| 'openfile'	Retrieve one or more files to be opened for reading.
---| 'openfolder'	Retrieve a folder.
---| 'savefile'	Retrieve a valid filename to be opened for writing.


---@class FileDialogSettings
---@field title? string Dialog window title.
---@field acceptlabel ? string Custom name for the Accept button.
---@field cancellabel? string Custom name for the Cancel button.
---@field defaultname? string Default folder/file name for the file text box.
---@field filters? table<string, string> Filter names as keys and filter pattern strings as values.
---@field multiselect? boolean Allow selecting multiple files.
---@field attachtowindow? boolean Attach to current game window.
