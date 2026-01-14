
---Mounts a full platform-dependent path to a zip file or folder for reading or writing in love.filesystem.
---@param archive string The full platform-dependent path to a folder or zip file to mount.
---@param mountpoint string The new path in love.filesystem the archive or the platform-dependent path will be mounted to.
---@param permission? MountPermission The requested permissions for operating on files and folders in this path after mounting ("read", or "readwrite").
---@param appendToPath? boolean Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game's source and save directories.
---@return boolean success True if the archive was successfully mounted with the given path and permissions, false otherwise.
function m.mountFullPath( archive, mountpoint, permission, appendToPath ) end

---Opens a new File object outside of love.filesystem paths.
---@param filename string The full platform-dependent path to the file.
---@param mode FileMode The mode to open the file in.
---@return File|nil file The new File object, or nil if an error occurred.
---@return string errorstr The error string if an error occurred.
function m.openNativeFile( filename, mode ) end

---Opens a new File object, which represents an existing or new file on disk.
---@param filename string The filename of the file.
---@param mode FileMode The mode to open the file in.
---@return File|nil file The new File object, or nil if an error occurred.
---@return string errorstr The error string if an error occurred.
function m.openFile( filename, mode ) end

---Mounts a common path for reading or writing in love.filesystem.
---@param commonpath CommonPath The common path to mount.
---@param mountpoint string The new path in love.filesystem the archive or the common path will be mounted to.
---@param permission? MountPermission The requested permissions for operating on files and folders in this path after mounting ("read", or "readwrite").
---@param appendToPath? boolean Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game's source and save directories.
---@return boolean success True if the archive was successfully mounted with the given path and permissions, false otherwise.
function m.mountCommonPath(commonpath, mountpoint, permission, appendToPath) end

---Unmounts a common path for reading or writing in love.filesystem.
---@param commonpath CommonPath The common path to unmount.
---@return boolean success True if the archive was successfully unmounted, false otherwise.
function m.unmountCommonPath(commonpath) end

---Gets the full platform-dependent path to a common path.
---@param commonpath CommonPath The common path to get the full path for.
---@return string path The full platform-dependent path to the common path.
function m.getFullCommonPath(commonpath) end

---@alias CommonPath
---| 'appsavedir'
---| 'appdocuments'
---| 'userhome'
---| 'userappdata'
---| 'userdesktop'
---| 'userdocuments'

---@alias MountPermission
---| 'read'
---| 'readwrite'