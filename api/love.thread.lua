--- @meta love.thread


--- @class love.thread
local m = {}











--- Creates or retrieves a named thread channel.
--- Creates or retrieves a named thread channel.
--- @param name string @The name of the channel you want to create or retrieve.
--- @return Channel @The Channel object associated with the name.
function m.getChannel(name) end


--- Create a new unnamed thread channel.
---
---One use for them is to pass new unnamed channels to other threads via Channel:push on a named channel.
--- Create a new unnamed thread channel.
---
---One use for them is to pass new unnamed channels to other threads via Channel:push on a named channel.
--- @return Channel @The new Channel object.
function m.newChannel() end


--- Creates a new Thread from a filename, string or FileData object containing Lua code.
--- Creates a new Thread from a filename, string or FileData object containing Lua code.
--- @param filename string @The name of the Lua file to use as the source.
--- @return Thread @A new Thread that has yet to be started.
--- @overload fun(fileData: FileData):Thread
--- @overload fun(codestring: string):Thread
function m.newThread(filename) end







return m