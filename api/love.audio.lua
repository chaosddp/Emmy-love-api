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













return m