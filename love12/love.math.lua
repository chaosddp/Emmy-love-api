---Generates a Perlin noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.
---
---It is widely used for procedural content generation.
---@param x number The number used to generate the noise value.
---@param y? number The number used to generate the noise value.
---@param z? number The number used to generate the noise value.
---@param w? number The number used to generate the noise value.
---@return number noise The noise value in the range of [0, 1].
function m.perlinNoise(x, y, z, w) end

---Generates a Simplex noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.
---
---It is widely used for procedural content generation.
---@param x number The number used to generate the noise value.
---@param y? number The number used to generate the noise value.
---@param z? number The number used to generate the noise value.
---@param w? number The number used to generate the noise value.
---@return number noise The noise value in the range of [0, 1].
function m.simplexNoise(x, y, z, w) end
