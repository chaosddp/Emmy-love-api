--- @meta love.video


--- @class love.video
local m = {}





--- @class VideoStream: Object
--- An object which decodes, streams, and controls Videos.
local VideoStream = {}

--- Gets the filename of the VideoStream.
--- Gets the filename of the VideoStream.
--- @return string @The filename of the VideoStream
function VideoStream:getFilename() end


--- Gets whether the VideoStream is playing.
--- Gets whether the VideoStream is playing.
--- @return boolean @Whether the VideoStream is playing.
function VideoStream:isPlaying() end


--- Pauses the VideoStream.
--- Pauses the VideoStream.
function VideoStream:pause() end


--- Plays the VideoStream.
--- Plays the VideoStream.
function VideoStream:play() end


--- Rewinds the VideoStream. Synonym to VideoStream:seek(0).
--- Rewinds the VideoStream. Synonym to VideoStream:seek(0).
function VideoStream:rewind() end


--- Sets the current playback position of the VideoStream.
--- Sets the current playback position of the VideoStream.
--- @param offset number @The time in seconds since the beginning of the VideoStream.
function VideoStream:seek(offset) end


--- Gets the current playback position of the VideoStream.
--- Gets the current playback position of the VideoStream.
--- @return number @The number of seconds sionce the beginning of the VideoStream.
function VideoStream:tell() end







--- Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can't draw videos, see love.graphics.newVideo for that.
--- Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can't draw videos, see love.graphics.newVideo for that.
--- @param filename string @The file path to the Ogg Theora video file.
--- @return VideoStream @A new VideoStream.
--- @overload fun(file: File):VideoStream
function m.newVideoStream(filename) end










return m