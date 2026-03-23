--- @meta love.video


--- @class love.video
local m = {}











--- Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can't draw videos, see love.graphics.newVideo for that.
--- Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can't draw videos, see love.graphics.newVideo for that.
--- @param filename string @The file path to the Ogg Theora video file.
--- @return VideoStream @A new VideoStream.
--- @overload fun(file: File):VideoStream
function m.newVideoStream(filename) end







return m