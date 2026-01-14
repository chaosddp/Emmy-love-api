

---Gets preferred locales in order of user's preference
---
---It is recommended to load preferred locales only once and if you want to listen to any changes (in case user changes system settings), use love.localechanged.
---@return string[] locales A sequence of strings in order of user's preference. Locales are in form xx_YY (or just xx when country is not available) where xx is an ISO-639 language specifier and YY (if available) is an ISO-3166 country code
function m.getPreferredLocales() end