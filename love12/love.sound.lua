
---Copies the specified section of the given SoundData into this one.\
---@param sourcedata SoundData The SoundData to copy from.
---@param sourcestart number The first sample in the source SoundData to copy from.
---@param samplecount number The total number of samples to copy.
---@param deststart number The first sample in the destination SoundData to copy to.
function SoundData:copyFrom(sourcedata, sourcestart, samplecount, deststart) end

function SoundData:slice() end
