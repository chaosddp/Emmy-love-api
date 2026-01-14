
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