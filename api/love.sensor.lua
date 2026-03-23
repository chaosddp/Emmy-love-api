---@meta

---Kinds of sensors.
---@alias SensorType
---| 'accelerometer'	#Accelerometer.
---| 'gyroscope'	#Gyroscope.

---Provides functionality to access device sensors such as an accelerometer or gyroscope.
---@class love.sensor
local m = {}

---Check if the specified sensor exists in the device.
---@param sensorType SensorType
---@return boolean
function m:hasSensor(sensorType) end

return m
