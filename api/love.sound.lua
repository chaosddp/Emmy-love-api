---@meta love.sound

---@class love.sound
---This module is responsible for decoding sound files. It can't play the sounds, see love.audio for that.
local m = {}

--region Decoder

---@class Decoder
---An object which can gradually decode a sound file.
local Decoder = {}
--endregion Decoder

--region SoundData

---@class SoundData
---Contains raw audio samples.
---
---You can not play SoundData back directly. You must wrap a Source object around it.
local SoundData = {}
---Returns the number of bits per sample.
---@return number bitdepth Either 8, or 16.
function SoundData:getBitDepth() end

---Returns the number of channels in the SoundData.
---@return number channels 1 for mono, 2 for stereo.
function SoundData:getChannelCount() end

---Gets the duration of the sound data.
---@return number duration The duration of the sound data in seconds.
function SoundData:getDuration() end

---Gets the value of the sample-point at the specified position. For stereo SoundData objects, the data from the left and right channels are interleaved in that order.
---@param i number @An integer value specifying the position of the sample (starting at 0).
---@return number sample The normalized samplepoint (range -1.0 to 1.0).
---@overload fun(i:number, channel:number):number
function SoundData:getSample(i) end

---Returns the number of samples per channel of the SoundData.
---@return number count Total number of samples.
function SoundData:getSampleCount() end

---Returns the sample rate of the SoundData.
---@return number rate Number of samples per second.
function SoundData:getSampleRate() end

---Sets the value of the sample-point at the specified position. For stereo SoundData objects, the data from the left and right channels are interleaved in that order.
---@param i number @An integer value specifying the position of the sample (starting at 0).
---@param sample number @The normalized samplepoint (range -1.0 to 1.0).
---@overload fun(i:number, channel:number, sample:number):void
function SoundData:setSample(i, sample) end

--endregion SoundData

---Attempts to find a decoder for the encoded sound data in the specified file.
---@param file File @The file with encoded sound data.
---@param buffer? number @The size of each decoded chunk, in bytes.
---@return Decoder decoder A new Decoder object.
---@overload fun(filename:string, buffer?:number):Decoder
function m.newDecoder(file, buffer) end

---Creates new SoundData from a filepath, File, or Decoder. It's also possible to create SoundData with a custom sample rate, channel and bit depth.
---
---The sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.
---@param filename string @The file name of the file to load.
---@return SoundData soundData A new SoundData object.
---@overload fun(file:File):SoundData
---@overload fun(decoder:Decoder):SoundData
---@overload fun(samples:number, rate?:number, bits?:number, channels?:number):SoundData
function m.newSoundData(filename) end



--love12 patch begin


---Copies the specified section of the given SoundData into this one.\
---@param sourcedata SoundData The SoundData to copy from.
---@param sourcestart number The first sample in the source SoundData to copy from.
---@param samplecount number The total number of samples to copy.
---@param deststart number The first sample in the destination SoundData to copy to.
function SoundData:copyFrom(sourcedata, sourcestart, samplecount, deststart) end

function SoundData:slice() end


--love12 patch end

return m