--- @meta love.audio


--- @class love.audio
local m = {}


--- The different distance models.
---
---Extended information can be found in the chapter "3.4. Attenuation By Distance" of the OpenAL 1.1 specification.
--- @alias DistanceModel
---| 'none' #Sources do not get attenuated.
---| 'inverse' #Inverse distance attenuation.
---| 'inverseclamped' #Inverse distance attenuation. Gain is clamped. In version 0.9.2 and older this is named '''inverse clamped'''.
---| 'linear' #Linear attenuation.
---| 'linearclamped' #Linear attenuation. Gain is clamped. In version 0.9.2 and older this is named '''linear clamped'''.
---| 'exponent' #Exponential attenuation.
---| 'exponentclamped' #Exponential attenuation. Gain is clamped. In version 0.9.2 and older this is named '''exponent clamped'''.


--- The different types of effects supported by love.audio.setEffect.
--- @alias EffectType
---| 'chorus' #Plays multiple copies of the sound with slight pitch and time variation. Used to make sounds sound "fuller" or "thicker".
---| 'compressor' #Decreases the dynamic range of the sound, making the loud and quiet parts closer in volume, producing a more uniform amplitude throughout time.
---| 'distortion' #Alters the sound by amplifying it until it clips, shearing off parts of the signal, leading to a compressed and distorted sound.
---| 'echo' #Decaying feedback based effect, on the order of seconds. Also known as delay; causes the sound to repeat at regular intervals at a decreasing volume.
---| 'equalizer' #Adjust the frequency components of the sound using a 4-band (low-shelf, two band-pass and a high-shelf) equalizer.
---| 'flanger' #Plays two copies of the sound; while varying the phase, or equivalently delaying one of them, by amounts on the order of milliseconds, resulting in phasing sounds.
---| 'reverb' #Decaying feedback based effect, on the order of milliseconds. Used to simulate the reflection off of the surroundings.
---| 'ringmodulator' #An implementation of amplitude modulation; multiplies the source signal with a simple waveform, to produce either volume changes, or inharmonic overtones.


--- The different types of waveforms that can be used with the '''ringmodulator''' EffectType.
--- @alias EffectWaveform
---| 'sawtooth' #A sawtooth wave, also known as a ramp wave. Named for its linear rise, and (near-)instantaneous fall along time.
---| 'sine' #A sine wave. Follows a trigonometric sine function.
---| 'square' #A square wave. Switches between high and low states (near-)instantaneously.
---| 'triangle' #A triangle wave. Follows a linear rise and fall that repeats periodically.


--- Types of filters for Sources.
--- @alias FilterType
---| 'lowpass' #Low-pass filter. High frequency sounds are attenuated.
---| 'highpass' #High-pass filter. Low frequency sounds are attenuated.
---| 'bandpass' #Band-pass filter. Both high and low frequency sounds are attenuated based on the given parameters.


--- Types of audio sources.
---
---A good rule of thumb is to use stream for music files and static for all short sound effects. Basically, you want to avoid loading large files into memory at once.
--- @alias SourceType
---| 'static' #The whole audio is decoded.
---| 'stream' #The audio is decoded in chunks when needed.
---| 'queue' #The audio must be manually queued by the user.


--- Units that represent time.
--- @alias TimeUnit
---| 'seconds' #Regular seconds.
---| 'samples' #Audio samples.










--- Gets a list of the names of the currently enabled effects.
--- Gets a list of the names of the currently enabled effects.
--- @return table @The list of the names of the currently enabled effects.
function m.getActiveEffects() end


--- Gets the current number of simultaneously playing sources.
--- Gets the current number of simultaneously playing sources.
--- @return number @The current number of simultaneously playing sources.
function m.getActiveSourceCount() end


--- Returns the distance attenuation model.
--- Returns the distance attenuation model.
--- @return DistanceModel @The current distance model. The default is 'inverseclamped'.
function m.getDistanceModel() end


--- Gets the current global scale factor for velocity-based doppler effects.
--- Gets the current global scale factor for velocity-based doppler effects.
--- @return number @The current doppler scale factor.
function m.getDopplerScale() end


--- Gets the settings associated with an effect.
--- Gets the settings associated with an effect.
--- @param name string @The name of the effect.
--- @return table @The settings associated with the effect.
function m.getEffect(name) end


--- Gets the maximum number of active effects supported by the system.
--- Gets the maximum number of active effects supported by the system.
--- @return number @The maximum number of active effects.
function m.getMaxSceneEffects() end


--- Gets the maximum number of active Effects in a single Source object, that the system can support.
--- Gets the maximum number of active Effects in a single Source object, that the system can support.
--- @return number @The maximum number of active Effects per Source.
function m.getMaxSourceEffects() end


--- Returns the orientation of the listener.
--- Returns the orientation of the listener.
--- @return number @Forward x of the listener orientation.
--- @return number @Forward y of the listener orientation.
--- @return number @Forward z of the listener orientation.
--- @return number @Up x of the listener orientation.
--- @return number @Up y of the listener orientation.
--- @return number @Up z of the listener orientation.
function m.getOrientation() end


--- Returns the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.
--- Returns the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.
--- @return number @The X position of the listener.
--- @return number @The Y position of the listener.
--- @return number @The Z position of the listener.
function m.getPosition() end


--- Gets a list of RecordingDevices on the system.
---
---The first device in the list is the user's default recording device. The list may be empty if there are no microphones connected to the system.
---
---Audio recording is currently not supported on iOS.
--- Gets a list of RecordingDevices on the system.
---
---The first device in the list is the user's default recording device. The list may be empty if there are no microphones connected to the system.
---
---Audio recording is currently not supported on iOS.
--- @return table @The list of connected recording devices.
function m.getRecordingDevices() end


--- Returns the velocity of the listener.
--- Returns the velocity of the listener.
--- @return number @The X velocity of the listener.
--- @return number @The Y velocity of the listener.
--- @return number @The Z velocity of the listener.
function m.getVelocity() end


--- Returns the master volume.
--- Returns the master volume.
--- @return number @The current master volume
function m.getVolume() end


--- Gets whether audio effects are supported in the system.
--- Gets whether audio effects are supported in the system.
--- @return boolean @True if effects are supported, false otherwise.
function m.isEffectsSupported() end


--- Creates a new Source usable for real-time generated sound playback with Source:queue.
--- Creates a new Source usable for real-time generated sound playback with Source:queue.
--- @param samplerate number @Number of samples per second when playing.
--- @param bitdepth number @Bits per sample (8 or 16).
--- @param channels number @1 for mono or 2 for stereo.
--- @param buffercount number @The number of buffers that can be queued up at any given time with Source:queue. Cannot be greater than 64. A sensible default (~8) is chosen if no value is specified.
--- @return Source @The new Source usable with Source:queue.
function m.newQueueableSource(samplerate, bitdepth, channels, buffercount) end


--- Creates a new Source from a filepath, File, Decoder or SoundData.
---
---Sources created from SoundData are always static.
--- Creates a new Source from a filepath, File, Decoder or SoundData.
---
---Sources created from SoundData are always static.
--- @param filename string @The filepath to the audio file.
--- @param type SourceType @Streaming or static source.
--- @return Source @A new Source that can play the specified audio.
--- @overload fun(file: File, type: SourceType):Source
--- @overload fun(decoder: Decoder, type: SourceType):Source
--- @overload fun(data: FileData, type: SourceType):Source
--- @overload fun(data: SoundData):Source
function m.newSource(filename, type) end


--- Pauses specific or all currently played Sources.
--- Pauses specific or all currently played Sources.
--- @return table @A table containing a list of Sources that were paused by this call.
--- @overload fun(source: Source, ...: Source):
--- @overload fun(sources: table):
function m.pause() end


--- Plays the specified Source.
--- Plays the specified Source.
--- @param source Source @The Source to play.
--- @overload fun(sources: table):
--- @overload fun(source1: Source, source2: Source, ...: Source):
function m.play(source) end


--- Sets the distance attenuation model.
--- Sets the distance attenuation model.
--- @param model DistanceModel @The new distance model.
function m.setDistanceModel(model) end


--- Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.
--- Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.
--- @param scale number @The new doppler scale factor. The scale must be greater than 0.
function m.setDopplerScale(scale) end


--- Defines an effect that can be applied to a Source.
---
---Not all system supports audio effects. Use love.audio.isEffectsSupported to check.
--- Defines an effect that can be applied to a Source.
---
---Not all system supports audio effects. Use love.audio.isEffectsSupported to check.
--- @param name string @The name of the effect.
--- @param settings table @The settings to use for this effect, with the following fields:
--- @return boolean @Whether the effect was successfully created.
--- @overload fun(name: string, enabled: boolean):boolean
function m.setEffect(name, settings) end


--- Sets whether the system should mix the audio with the system's audio.
--- Sets whether the system should mix the audio with the system's audio.
--- @param mix boolean @True to enable mixing, false to disable it.
--- @return boolean @True if the change succeeded, false otherwise.
function m.setMixWithSystem(mix) end


--- Sets the orientation of the listener.
--- Sets the orientation of the listener.
--- @param fx, fy, fz number @Forward vector of the listener orientation.
--- @param ux, uy, uz number @Up vector of the listener orientation.
function m.setOrientation(fx, fy, fz, ux, uy, uz) end


--- Sets the position of the listener, which determines how sounds play.
--- Sets the position of the listener, which determines how sounds play.
--- @param x number @The x position of the listener.
--- @param y number @The y position of the listener.
--- @param z number @The z position of the listener.
function m.setPosition(x, y, z) end


--- Sets the velocity of the listener.
--- Sets the velocity of the listener.
--- @param x number @The X velocity of the listener.
--- @param y number @The Y velocity of the listener.
--- @param z number @The Z velocity of the listener.
function m.setVelocity(x, y, z) end


--- Sets the master volume.
--- Sets the master volume.
--- @param volume number @1.0 is max and 0.0 is off.
function m.setVolume(volume) end


--- Stops currently played sources.
--- Stops currently played sources.
--- @overload fun(source: Source):
--- @overload fun(source1: Source, source2: Source, ...: Source):
--- @overload fun(sources: table):
function m.stop() end







return m