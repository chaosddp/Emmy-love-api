--- @meta love.math


--- @class love.math
local m = {}


--- The layout of matrix elements (row-major or column-major).
--- @alias MatrixLayout
---| 'row' #The matrix is row-major:
---| 'column' #The matrix is column-major:










--- Converts a color from 0..255 to 0..1 range.
--- Converts a color from 0..255 to 0..1 range.
--- @param rb number @Red color component in 0..255 range.
--- @param gb number @Green color component in 0..255 range.
--- @param bb number @Blue color component in 0..255 range.
--- @param ab number @Alpha color component in 0..255 range.
--- @return number @Red color component in 0..1 range.
--- @return number @Green color component in 0..1 range.
--- @return number @Blue color component in 0..1 range.
--- @return number @Alpha color component in 0..1 range or nil if alpha is not specified.
function m.colorFromBytes(rb, gb, bb, ab) end


--- Converts a color from 0..1 to 0..255 range.
--- Converts a color from 0..1 to 0..255 range.
--- @param r number @Red color component.
--- @param g number @Green color component.
--- @param b number @Blue color component.
--- @param a number @Alpha color component.
--- @return number @Red color component in 0..255 range.
--- @return number @Green color component in 0..255 range.
--- @return number @Blue color component in 0..255 range.
--- @return number @Alpha color component in 0..255 range or nil if alpha is not specified.
function m.colorToBytes(r, g, b, a) end


--- Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering and you need to do math in linear RGB in the few cases where LÖVE doesn't handle conversions automatically.
---
---Read more about gamma-correct rendering here, here, and here.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
--- Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering and you need to do math in linear RGB in the few cases where LÖVE doesn't handle conversions automatically.
---
---Read more about gamma-correct rendering here, here, and here.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
--- @param r number @The red channel of the sRGB color to convert.
--- @param g number @The green channel of the sRGB color to convert.
--- @param b number @The blue channel of the sRGB color to convert.
--- @return number @The red channel of the converted color in linear RGB space.
--- @return number @The green channel of the converted color in linear RGB space.
--- @return number @The blue channel of the converted color in linear RGB space.
--- @overload fun(color: table):number, number, number
--- @overload fun(c: number):number
function m.gammaToLinear(r, g, b) end


--- Gets the seed of the random number generator.
---
---The seed is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer  values above 2^53, but the seed can be an integer value up to 2^64.
--- Gets the seed of the random number generator.
---
---The seed is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer  values above 2^53, but the seed can be an integer value up to 2^64.
--- @return number @Integer number representing the lower 32 bits of the random number generator's 64 bit seed value.
--- @return number @Integer number representing the higher 32 bits of the random number generator's 64 bit seed value.
function m.getRandomSeed() end


--- Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with love.math.setRandomState or RandomGenerator:setState.
---
---This is different from love.math.getRandomSeed in that getRandomState gets the random number generator's current state, whereas getRandomSeed gets the previously set seed number.
--- Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with love.math.setRandomState or RandomGenerator:setState.
---
---This is different from love.math.getRandomSeed in that getRandomState gets the random number generator's current state, whereas getRandomSeed gets the previously set seed number.
--- @return string @The current state of the random number generator, represented as a string.
function m.getRandomState() end


--- Checks whether a polygon is convex.
---
---PolygonShapes in love.physics, some forms of Meshes, and polygons drawn with love.graphics.polygon must be simple convex polygons.
--- Checks whether a polygon is convex.
---
---PolygonShapes in love.physics, some forms of Meshes, and polygons drawn with love.graphics.polygon must be simple convex polygons.
--- @param vertices table @The vertices of the polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.
--- @return boolean @Whether the given polygon is convex.
--- @overload fun(x1: number, y1: number, x2: number, y2: number, ...: number):boolean
function m.isConvex(vertices) end


--- Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.
---
---In general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.
---
---Read more about gamma-correct rendering here, here, and here.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
--- Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.
---
---In general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.
---
---Read more about gamma-correct rendering here, here, and here.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
--- @param lr number @The red channel of the linear RGB color to convert.
--- @param lg number @The green channel of the linear RGB color to convert.
--- @param lb number @The blue channel of the linear RGB color to convert.
--- @return number @The red channel of the converted color in gamma sRGB space.
--- @return number @The green channel of the converted color in gamma sRGB space.
--- @return number @The blue channel of the converted color in gamma sRGB space.
--- @overload fun(color: table):number, number, number
--- @overload fun(lc: number):number
function m.linearToGamma(lr, lg, lb) end


--- Creates a new BezierCurve object.
---
---The number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.
--- Creates a new BezierCurve object.
---
---The number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.
--- @param vertices table @The vertices of the control polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.
--- @return BezierCurve @A Bézier curve object.
--- @overload fun(x1: number, y1: number, x2: number, y2: number, ...: number):BezierCurve
function m.newBezierCurve(vertices) end


--- Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.
--- Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.
--- @return RandomGenerator @The new Random Number Generator object.
--- @overload fun(seed: number):RandomGenerator
--- @overload fun(low: number, high: number):RandomGenerator
function m.newRandomGenerator() end


--- Creates a new Transform object.
--- Creates a new Transform object.
--- @return Transform @The new Transform object.
--- @overload fun(x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number):Transform
function m.newTransform() end


--- Generates a Simplex or Perlin noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.
---
---Simplex noise is closely related to Perlin noise. It is widely used for procedural content generation.
---
---There are many webpages which discuss Perlin and Simplex noise in detail.
--- Generates a Simplex or Perlin noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.
---
---Simplex noise is closely related to Perlin noise. It is widely used for procedural content generation.
---
---There are many webpages which discuss Perlin and Simplex noise in detail.
--- @param x number @The number used to generate the noise value.
--- @return number @The noise value in the range of 1.
--- @overload fun(x: number, y: number):number
--- @overload fun(x: number, y: number, z: number):number
--- @overload fun(x: number, y: number, z: number, w: number):number
function m.noise(x) end


--- Generates a pseudo-random number in a platform independent manner. The default love.run seeds this function at startup, so you generally don't need to seed it yourself.
--- Generates a pseudo-random number in a platform independent manner. The default love.run seeds this function at startup, so you generally don't need to seed it yourself.
--- @return number @The pseudo-random number.
--- @overload fun(max: number):number
--- @overload fun(min: number, max: number):number
function m.random() end


--- Get a normally distributed pseudo random number.
--- Get a normally distributed pseudo random number.
--- @param stddev number @Standard deviation of the distribution.
--- @param mean number @The mean of the distribution.
--- @return number @Normally distributed random number with variance (stddev)² and the specified mean.
function m.randomNormal(stddev, mean) end


--- Sets the seed of the random number generator using the specified integer number. This is called internally at startup, so you generally don't need to call it yourself.
--- Sets the seed of the random number generator using the specified integer number. This is called internally at startup, so you generally don't need to call it yourself.
--- @param seed number @The integer number with which you want to seed the randomization. Must be within the range of 2^53 - 1.
--- @overload fun(low: number, high: number):
function m.setRandomSeed(seed) end


--- Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to love.math.getRandomState.
---
---This is different from love.math.setRandomSeed in that setRandomState directly sets the random number generator's current implementation-dependent state, whereas setRandomSeed gives it a new seed value.
--- Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to love.math.getRandomState.
---
---This is different from love.math.setRandomSeed in that setRandomState directly sets the random number generator's current implementation-dependent state, whereas setRandomSeed gives it a new seed value.
--- @param state string @The new state of the random number generator, represented as a string. This should originate from a previous call to love.math.getRandomState.
function m.setRandomState(state) end


--- Decomposes a simple convex or concave polygon into triangles.
--- Decomposes a simple convex or concave polygon into triangles.
--- @param polygon table @Polygon to triangulate. Must not intersect itself.
--- @return table @List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3},  {x1, y1, x2, y2, x3, y3}, ...}.
--- @overload fun(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number):table
function m.triangulate(polygon) end







return m