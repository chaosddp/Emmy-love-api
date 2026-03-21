--- @meta love.filesystem


--- @class love.filesystem
local m = {}


--- Buffer modes for File objects.
--- @alias BufferMode
---| 'none' #No buffering. The result of write and append operations appears immediately.
---| 'line' #Line buffering. Write and append operations are buffered until a newline is output or the buffer size limit is reached.
---| 'full' #Full buffering. Write and append operations are always buffered until the buffer size limit is reached.


--- How to decode a given FileData.
--- @alias FileDecoder
---| 'file' #The data is unencoded.
---| 'base64' #The data is base64-encoded.


--- The different modes you can open a File in.
--- @alias FileMode
---| 'r' #Open a file for read.
---| 'w' #Open a file for write.
---| 'a' #Open a file for append.
---| 'c' #Do not open a file (represents a closed file.)


--- The type of a file.
--- @alias FileType
---| 'file' #Regular file.
---| 'directory' #Directory.
---| 'symlink' #Symbolic link.
---| 'other' #Something completely different like a device.













return m