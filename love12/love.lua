---Callback function triggered when the user's system locale preferences have changed.
---@type fun():void
m.localechanged = nil

---Callback function triggered when a file or folder is first dragged onto the window, before the user drops it.
---
---This can be used to change the cursor to something indicating a drag-and-drop operation, for example.
---@type fun(): void
m.dropbegan = nil

---Callback function triggered when an in-progress file or folder drag-and-drop operation changes position within the window.
---@type fun(x: number, y: number):void
m.dropmoved = nil

---Callback function triggered when a file or folder is done being dragged and dropped into the window.
---@type fun(x: number, y: number):void
m.dropcompleted = nil

---Called when the active audio device is disconnected (e.g. physically unplugging headphones).
---
---All audio are stopped and loses their playback position when this callback is called.
---@type fun(sources:Source[]):void
m.audiodisconnected = nil

---Called when the in-device sensor is updated with new values.
---Only sensors enabled with love.sensor.setEnabled will trigger this event.
---@type fun(sensorType:SensorType, x: number, y: number, z: number):void
m.sensorupdated = nil

---Called when a Joystick's sensor is updated with new values.
---
---Only Joystick sensors enabled with Joystick:setSensorEnabled will trigger this event.
---@type fun(joystick: Joystick, sensorType: SensorType, x: number, y: number, z: number):void
m.joysticksensorupdated = nil

---Callback function triggered when the window is completely covered by other windows.
---
---An occluded window is distinct from a window which is not visible.
---
---If the window is uncovered after being covered, the love.exposed callback will be called.
---@type fun():void
m.occluded = nil

---Callback function triggered when the window is uncovered.
---
---If the window is covered after being uncovered, the love.occluded callback will be called.
---@type fun():void
m.exposed = nil