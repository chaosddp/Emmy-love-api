--- @meta love.sound


--- @class love.sound
local m = {}











--- Attempts to find a decoder for the encoded sound data in the specified file.
--- Attempts to find a decoder for the encoded sound data in the specified file.
--- @param file File @The file with encoded sound data.
--- @param buffer number @The size of each decoded chunk, in bytes.
--- @return Decoder @A new Decoder object.
--- @overload fun(filename: string, buffer: number):Decoder
function m.newDecoder(file, buffer) end


--- Creates new SoundData from a filepath, File, or Decoder. It's also possible to create SoundData with a custom sample rate, channel and bit depth.
---
---The sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.
--- Creates new SoundData from a filepath, File, or Decoder. It's also possible to create SoundData with a custom sample rate, channel and bit depth.
---
---The sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.
--- @param filename string @The file name of the file to load.
--- @return SoundData @A new SoundData object.
--- @overload fun(file: File):SoundData
--- @overload fun(decoder: Decoder):SoundData
--- @overload fun(samples: number, rate: number, bits: number, channels: number):SoundData
function m.newSoundData(filename) end







return m