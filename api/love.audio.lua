---@meta love.audio

---@class love.audio
---Provides an interface to create noise with the user's speakers.
local m = {}

--region RecordingDevice

---@class RecordingDevice
---Represents an audio input device capable of recording sounds.
local RecordingDevice = {}
---Gets the number of bits per sample in the data currently being recorded.
---@return number bits The number of bits per sample in the data that's currently being recorded.
function RecordingDevice:getBitDepth() end

---Gets the number of channels currently being recorded (mono or stereo).
---@return number channels The number of channels being recorded (1 for mono, 2 for stereo).
function RecordingDevice:getChannelCount() end

---Gets all recorded audio SoundData stored in the device's internal ring buffer.
---
---The internal ring buffer is cleared when this function is called, so calling it again will only get audio recorded after the previous call. If the device's internal ring buffer completely fills up before getData is called, the oldest data that doesn't fit into the buffer will be lost.
---@return SoundData data The recorded audio data, or nil if the device isn't recording.
function RecordingDevice:getData() end

---Gets the name of the recording device.
---@return string name The name of the device.
function RecordingDevice:getName() end

---Gets the number of currently recorded samples.
---@return number samples The number of samples that have been recorded so far.
function RecordingDevice:getSampleCount() end

---Gets the number of samples per second currently being recorded.
---@return number rate The number of samples being recorded per second (sample rate).
function RecordingDevice:getSampleRate() end

---Gets whether the device is currently recording.
---@return boolean recording True if the recording, false otherwise.
function RecordingDevice:isRecording() end

---Begins recording audio using this device.
---@param samplecount number @The maximum number of samples to store in an internal ring buffer when recording. RecordingDevice:getData clears the internal buffer when called.
---@param samplerate? number @The number of samples per second to store when recording.
---@param bitdepth? number @The number of bits per sample.
---@param channels? number @Whether to record in mono or stereo. Most microphones don't support more than 1 channel.
---@return boolean success True if the device successfully began recording using the specified parameters, false if not.
function RecordingDevice:start(samplecount, samplerate, bitdepth, channels) end

---Stops recording audio from this device. Any sound data currently in the device's buffer will be returned.
---@return SoundData data The sound data currently in the device's buffer, or nil if the device wasn't recording.
function RecordingDevice:stop() end

--endregion RecordingDevice

--region Source

---@class Source
---A Source represents audio you can play back.
---
---You can do interesting things with Sources, like set the volume, pitch, and its position relative to the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.
---
---The Source controls (play/pause/stop) act according to the following state table.
local Source = {}
--endregion Source

---The different distance models.
---
---Extended information can be found in the chapter "3.4. Attenuation By Distance" of the OpenAL 1.1 specification.
---@alias DistanceModel
---| 'none'	#Sources do not get attenuated.
---| 'inverse'	#Inverse distance attenuation.
---| 'inverseclamped'	#Inverse distance attenuation. Gain is clamped. In version 0.9.2 and older this is named '''inverse clamped'''.
---| 'linear'	#Linear attenuation.
---| 'linearclamped'	#Linear attenuation. Gain is clamped. In version 0.9.2 and older this is named '''linear clamped'''.
---| 'exponent'	#Exponential attenuation.
---| 'exponentclamped'	#Exponential attenuation. Gain is clamped. In version 0.9.2 and older this is named '''exponent clamped'''.

---The different types of effects supported by love.audio.setEffect.
---@alias EffectType
---| 'chorus'	#Plays multiple copies of the sound with slight pitch and time variation. Used to make sounds sound "fuller" or "thicker".
---| 'compressor'	#Decreases the dynamic range of the sound, making the loud and quiet parts closer in volume, producing a more uniform amplitude throughout time.
---| 'distortion'	#Alters the sound by amplifying it until it clips, shearing off parts of the signal, leading to a compressed and distorted sound.
---| 'echo'	#Decaying feedback based effect, on the order of seconds. Also known as delay; causes the sound to repeat at regular intervals at a decreasing volume.
---| 'equalizer'	#Adjust the frequency components of the sound using a 4-band (low-shelf, two band-pass and a high-shelf) equalizer.
---| 'flanger'	#Plays two copies of the sound; while varying the phase, or equivalently delaying one of them, by amounts on the order of milliseconds, resulting in phasing sounds.
---| 'reverb'	#Decaying feedback based effect, on the order of milliseconds. Used to simulate the reflection off of the surroundings.
---| 'ringmodulator'	#An implementation of amplitude modulation; multiplies the source signal with a simple waveform, to produce either volume changes, or inharmonic overtones.

---The different types of waveforms that can be used with the '''ringmodulator''' EffectType.
---@alias EffectWaveform
---| 'sawtooth'	#A sawtooth wave, also known as a ramp wave. Named for its linear rise, and (near-)instantaneous fall along time.
---| 'sine'	#A sine wave. Follows a trigonometric sine function.
---| 'square'	#A square wave. Switches between high and low states (near-)instantaneously.
---| 'triangle'	#A triangle wave. Follows a linear rise and fall that repeats periodically.

---Types of filters for Sources.
---@alias FilterType
---| 'lowpass'	#Low-pass filter. High frequency sounds are attenuated.
---| 'highpass'	#High-pass filter. Low frequency sounds are attenuated.
---| 'bandpass'	#Band-pass filter. Both high and low frequency sounds are attenuated based on the given parameters.

---Types of audio sources.
---
---A good rule of thumb is to use stream for music files and static for all short sound effects. Basically, you want to avoid loading large files into memory at once.
---@alias SourceType
---| 'static'	#The whole audio is decoded.
---| 'stream'	#The audio is decoded in chunks when needed.
---| 'queue'	#The audio must be manually queued by the user.

---Units that represent time.
---@alias TimeUnit
---| 'seconds'	#Regular seconds.
---| 'samples'	#Audio samples.



--love12 patch begin


---Gets the currently active playback device.
---@return string device The name of the current playback device.
function m.getPlaybackDevice() end

---Gets a list of playback devices on the system.
---The first device in the list is the user's default playback device.
---@return string[] devices The list of connected playback device names as strings.
function m.getPlaybackDevices() end

---Sets the playback device to use for audio playback.
---@param device string The name of the playback device to use.
function m.setPlaybackDevice(device) end

--love12 patch end

return m