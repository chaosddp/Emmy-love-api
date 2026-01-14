---@meta love.filesystem

---@class love.filesystem
---Provides an interface to the user's filesystem.
local m = {}

--region DroppedFile

---@class DroppedFile
---Represents a file dropped onto the window.
---
---Note that the DroppedFile type can only be obtained from love.filedropped callback, and can't be constructed manually by the user.
local DroppedFile = {}
--endregion DroppedFile

--region File

---@class File
---Represents a file on the filesystem. A function that takes a file path can also take a File.
local File = {}
---Closes a File.
---@return boolean success Whether closing was successful.
function File:close() end

---Flushes any buffered written data in the file to the disk.
---@return boolean success Whether the file successfully flushed any buffered data to the disk.
---@return string err The error string, if an error occurred and the file could not be flushed.
function File:flush() end

---Gets the buffer mode of a file.
---@return BufferMode mode The current buffer mode of the file.
---@return number size The maximum size in bytes of the file's buffer.
function File:getBuffer() end

---Gets the filename that the File object was created with. If the file object originated from the love.filedropped callback, the filename will be the full platform-dependent file path.
---@return string filename The filename of the File.
function File:getFilename() end

---Gets the FileMode the file has been opened with.
---@return FileMode mode The mode this file has been opened with.
function File:getMode() end

---Returns the file size.
---@return number size The file size in bytes.
function File:getSize() end

---Gets whether end-of-file has been reached.
---@return boolean eof Whether EOF has been reached.
function File:isEOF() end

---Gets whether the file is open.
---@return boolean open True if the file is currently open, false otherwise.
function File:isOpen() end

---Iterate over all the lines in a file.
---@return function iterator The iterator (can be used in for loops).
function File:lines() end

---Open the file for write, read or append.
---@param mode FileMode @The mode to open the file in.
---@return boolean ok True on success, false otherwise.
---@return string err The error string if an error occurred.
function File:open(mode) end

---Read a number of bytes from a file.
---@param bytes? number @The number of bytes to read.
---@return string contents The contents of the read bytes.
---@return number size How many bytes have been read.
---@overload fun(container:ContainerType, bytes?:number):FileDataorstring, number
function File:read(bytes) end

---Seek to a position in a file
---@param pos number @The position to seek to
---@return boolean success Whether the operation was successful
function File:seek(pos) end

---Sets the buffer mode for a file opened for writing or appending. Files with buffering enabled will not write data to the disk until the buffer size limit is reached, depending on the buffer mode.
---
---File:flush will force any buffered data to be written to the disk.
---@param mode BufferMode @The buffer mode to use.
---@param size? number @The maximum size in bytes of the file's buffer.
---@return boolean success Whether the buffer mode was successfully set.
---@return string errorstr The error string, if the buffer mode could not be set and an error occurred.
function File:setBuffer(mode, size) end

---Returns the position in the file.
---@return number pos The current position.
function File:tell() end

---Write data to a file.
---@param data string @The string data to write.
---@param size? number @How many bytes to write.
---@return boolean success Whether the operation was successful.
---@return string err The error string if an error occurred.
---@overload fun(data:Data, size?:number):boolean, string
function File:write(data, size) end

--endregion File

--region FileData

---@class FileData
---Data representing the contents of a file.
local FileData = {}
---Gets the extension of the FileData.
---@return string ext The extension of the file the FileData represents.
function FileData:getExtension() end

---Gets the filename of the FileData.
---@return string name The name of the file the FileData represents.
function FileData:getFilename() end

--endregion FileData

---Buffer modes for File objects.
---@alias BufferMode
---| 'none'	#No buffering. The result of write and append operations appears immediately.
---| 'line'	#Line buffering. Write and append operations are buffered until a newline is output or the buffer size limit is reached.
---| 'full'	#Full buffering. Write and append operations are always buffered until the buffer size limit is reached.

---How to decode a given FileData.
---@alias FileDecoder
---| 'file'	#The data is unencoded.
---| 'base64'	#The data is base64-encoded.

---The different modes you can open a File in.
---@alias FileMode
---| 'r'	#Open a file for read.
---| 'w'	#Open a file for write.
---| 'a'	#Open a file for append.
---| 'c'	#Do not open a file (represents a closed file.)

---The type of a file.
---@alias FileType
---| 'file'	#Regular file.
---| 'directory'	#Directory.
---| 'symlink'	#Symbolic link.
---| 'other'	#Something completely different like a device.



--love12 patch begin


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

--love12 patch end

return m