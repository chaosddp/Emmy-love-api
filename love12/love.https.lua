---@meta

---@class RequestOptions
---@field data? string
---@field headers? table<string, any>
---@field method? string | "GET" | "POST"
RequestOptions = {}

---@class love.https
local m = {}

---lua-https is a simple Lua HTTPS module using native platform backends specifically written for LÖVE 12.0 and supports Windows, Linux, macOS, iOS, and Android.
---To use lua-https, load it with require like local https = require("https"). lua-https does not create global variables!
---
---The https table expose single function: https.request
---
---local url = require("socket.url")
---
---url.escape(k)
---@param url string HTTP or HTTPS URL to access.
---@param options? RequestOptions Options for advanced mode.
---@return number code HTTP status code, or 0 on failure.
---@return string|nil body HTTP response body or nil on failure.
---@return table<string, any>|nil headers available if provided advance options. HTTP response headers as key-value pairs or nil on failure.
function m.request(url, options) end

return m