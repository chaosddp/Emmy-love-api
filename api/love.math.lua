---@meta love.math

---@class love.math
---Provides system-independent mathematical functions.
local m = {}

--region BezierCurve

---@class BezierCurve
---A Bézier curve object that can evaluate and render Bézier curves of arbitrary degree.
---
---For more information on Bézier curves check this great article on Wikipedia.
local BezierCurve = {}
---Evaluate Bézier curve at parameter t. The parameter must be between 0 and 1 (inclusive).
---
---This function can be used to move objects along paths or tween parameters. However it should not be used to render the curve, see BezierCurve:render for that purpose.
---@param t number @Where to evaluate the curve.
---@return number x x coordinate of the curve at parameter t.
---@return number y y coordinate of the curve at parameter t.
function BezierCurve:evaluate(t) end

---Get coordinates of the i-th control point. Indices start with 1.
---@param i number @Index of the control point.
---@return number x Position of the control point along the x axis.
---@return number y Position of the control point along the y axis.
function BezierCurve:getControlPoint(i) end

---Get the number of control points in the Bézier curve.
---@return number count The number of control points.
function BezierCurve:getControlPointCount() end

---Get degree of the Bézier curve. The degree is equal to number-of-control-points - 1.
---@return number degree Degree of the Bézier curve.
function BezierCurve:getDegree() end

---Get the derivative of the Bézier curve.
---
---This function can be used to rotate sprites moving along a curve in the direction of the movement and compute the direction perpendicular to the curve at some parameter t.
---@return BezierCurve derivative The derivative curve.
function BezierCurve:getDerivative() end

---Gets a BezierCurve that corresponds to the specified segment of this BezierCurve.
---@param startpoint number @The starting point along the curve. Must be between 0 and 1.
---@param endpoint number @The end of the segment. Must be between 0 and 1.
---@return BezierCurve curve A BezierCurve that corresponds to the specified segment.
function BezierCurve:getSegment(startpoint, endpoint) end

---Insert control point as the new i-th control point. Existing control points from i onwards are pushed back by 1. Indices start with 1. Negative indices wrap around: -1 is the last control point, -2 the one before the last, etc.
---@param x number @Position of the control point along the x axis.
---@param y number @Position of the control point along the y axis.
---@param i? number @Index of the control point.
function BezierCurve:insertControlPoint(x, y, i) end

---Removes the specified control point.
---@param index number @The index of the control point to remove.
function BezierCurve:removeControlPoint(index) end

---Get a list of coordinates to be used with love.graphics.line.
---
---This function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.
---
---If you are just interested to know the position on the curve given a parameter, use BezierCurve:evaluate.
---@param depth? number @Number of recursive subdivision steps.
---@return table coordinates List of x,y-coordinate pairs of points on the curve.
function BezierCurve:render(depth) end

---Get a list of coordinates on a specific part of the curve, to be used with love.graphics.line.
---
---This function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.
---
---If you are just need to know the position on the curve given a parameter, use BezierCurve:evaluate.
---@param startpoint number @The starting point along the curve. Must be between 0 and 1.
---@param endpoint number @The end of the segment to render. Must be between 0 and 1.
---@param depth? number @Number of recursive subdivision steps.
---@return table coordinates List of x,y-coordinate pairs of points on the specified part of the curve.
function BezierCurve:renderSegment(startpoint, endpoint, depth) end

---Rotate the Bézier curve by an angle.
---@param angle number @Rotation angle in radians.
---@param ox? number @X coordinate of the rotation center.
---@param oy? number @Y coordinate of the rotation center.
function BezierCurve:rotate(angle, ox, oy) end

---Scale the Bézier curve by a factor.
---@param s number @Scale factor.
---@param ox? number @X coordinate of the scaling center.
---@param oy? number @Y coordinate of the scaling center.
function BezierCurve:scale(s, ox, oy) end

---Set coordinates of the i-th control point. Indices start with 1.
---@param i number @Index of the control point.
---@param x number @Position of the control point along the x axis.
---@param y number @Position of the control point along the y axis.
function BezierCurve:setControlPoint(i, x, y) end

---Move the Bézier curve by an offset.
---@param dx number @Offset along the x axis.
---@param dy number @Offset along the y axis.
function BezierCurve:translate(dx, dy) end

--endregion BezierCurve

--region RandomGenerator

---@class RandomGenerator
---A random number generation object which has its own random state.
local RandomGenerator = {}
---Gets the seed of the random number generator object.
---
---The seed is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer  values above 2^53, but the seed value is an integer number in the range of 2^64 - 1.
---@return number low Integer number representing the lower 32 bits of the RandomGenerator's 64 bit seed value.
---@return number high Integer number representing the higher 32 bits of the RandomGenerator's 64 bit seed value.
function RandomGenerator:getSeed() end

---Gets the current state of the random number generator. This returns an opaque string which is only useful for later use with RandomGenerator:setState in the same major version of LÖVE.
---
---This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.
---@return string state The current state of the RandomGenerator object, represented as a string.
function RandomGenerator:getState() end

---Generates a pseudo-random number in a platform independent manner.
---@return number number The pseudo-random number.
---@overload fun(max:number):number
---@overload fun(min:number, max:number):number
function RandomGenerator:random() end

---Get a normally distributed pseudo random number.
---@param stddev? number @Standard deviation of the distribution.
---@param mean? number @The mean of the distribution.
---@return number number Normally distributed random number with variance (stddev)² and the specified mean.
function RandomGenerator:randomNormal(stddev, mean) end

---Sets the seed of the random number generator using the specified integer number.
---@param seed number @The integer number with which you want to seed the randomization. Must be within the range of 2^53.
---@overload fun(low:number, high:number):void
function RandomGenerator:setSeed(seed) end

---Sets the current state of the random number generator. The value used as an argument for this function is an opaque string and should only originate from a previous call to RandomGenerator:getState in the same major version of LÖVE.
---
---This is different from RandomGenerator:setSeed in that setState directly sets the RandomGenerator's current implementation-dependent state, whereas setSeed gives it a new seed value.
---@param state string @The new state of the RandomGenerator object, represented as a string. This should originate from a previous call to RandomGenerator:getState.
function RandomGenerator:setState(state) end

--endregion RandomGenerator

--region Transform

---@class Transform
---Object containing a coordinate system transformation.
---
---The love.graphics module has several functions and function variants which accept Transform objects.
local Transform = {}
---Applies the given other Transform object to this one.
---
---This effectively multiplies this Transform's internal transformation matrix with the other Transform's (i.e. self * other), and stores the result in this object.
---@param other Transform @The other Transform object to apply to this Transform.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:apply(other) end

---Creates a new copy of this Transform.
---@return Transform clone The copy of this Transform.
function Transform:clone() end

---Gets the internal 4x4 transformation matrix stored by this Transform. The matrix is returned in row-major order.
---@return number e1_1 The first column of the first row of the matrix.
---@return number e1_2 The second column of the first row of the matrix.
---@return number e1_3 The third column of the first row of the matrix.
---@return number e1_4 The fourth column of the first row of the matrix.
---@return number e2_1 The first column of the second row of the matrix.
---@return number e2_2 The second column of the second row of the matrix.
---@return number e2_3 The third column of the second row of the matrix.
---@return number e2_4 The fourth column of the second row of the matrix.
---@return number e3_1 The first column of the third row of the matrix.
---@return number e3_2 The second column of the third row of the matrix.
---@return number e3_3 The third column of the third row of the matrix.
---@return number e3_4 The fourth column of the third row of the matrix.
---@return number e4_1 The first column of the fourth row of the matrix.
---@return number e4_2 The second column of the fourth row of the matrix.
---@return number e4_3 The third column of the fourth row of the matrix.
---@return number e4_4 The fourth column of the fourth row of the matrix.
function Transform:getMatrix() end

---Creates a new Transform containing the inverse of this Transform.
---@return Transform inverse A new Transform object representing the inverse of this Transform's matrix.
function Transform:inverse() end

---Applies the reverse of the Transform object's transformation to the given 2D position.
---
---This effectively converts the given position from the local coordinate space of the Transform into global coordinates.
---
---One use of this method can be to convert a screen-space mouse position into global world coordinates, if the given Transform has transformations applied that are used for a camera system in-game.
---@param localX number @The x component of the position with the transform applied.
---@param localY number @The y component of the position with the transform applied.
---@return number globalX The x component of the position in global coordinates.
---@return number globalY The y component of the position in global coordinates.
function Transform:inverseTransformPoint(localX, localY) end

---Checks whether the Transform is an affine transformation.
---@return boolean affine true if the transform object is an affine transformation, false otherwise.
function Transform:isAffine2DTransform() end

---Resets the Transform to an identity state. All previously applied transformations are erased.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:reset() end

---Applies a rotation to the Transform's coordinate system. This method does not reset any previously applied transformations.
---@param angle number @The relative angle in radians to rotate this Transform by.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:rotate(angle) end

---Scales the Transform's coordinate system. This method does not reset any previously applied transformations.
---@param sx number @The relative scale factor along the x-axis.
---@param sy? number @The relative scale factor along the y-axis.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:scale(sx, sy) end

---Directly sets the Transform's internal 4x4 transformation matrix.
---@param e1_1 number @The first column of the first row of the matrix.
---@param e1_2 number @The second column of the first row of the matrix.
---@param e1_3 number @The third column of the first row of the matrix.
---@param e1_4 number @The fourth column of the first row of the matrix.
---@param e2_1 number @The first column of the second row of the matrix.
---@param e2_2 number @The second column of the second row of the matrix.
---@param e2_3 number @The third column of the second row of the matrix.
---@param e2_4 number @The fourth column of the second row of the matrix.
---@param e3_1 number @The first column of the third row of the matrix.
---@param e3_2 number @The second column of the third row of the matrix.
---@param e3_3 number @The third column of the third row of the matrix.
---@param e3_4 number @The fourth column of the third row of the matrix.
---@param e4_1 number @The first column of the fourth row of the matrix.
---@param e4_2 number @The second column of the fourth row of the matrix.
---@param e4_3 number @The third column of the fourth row of the matrix.
---@param e4_4 number @The fourth column of the fourth row of the matrix.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
---@overload fun(layout:MatrixLayout, e1_1:number, e1_2:number, e1_3:number, e1_4:number, e2_1:number, e2_2:number, e2_3:number, e2_4:number, e3_1:number, e3_2:number, e3_3:number, e3_4:number, e4_1:number, e4_2:number, e4_3:number, e4_4:number):Transform
---@overload fun(layout:MatrixLayout, matrix:table):Transform
---@overload fun(layout:MatrixLayout, matrix:table):Transform
function Transform:setMatrix(e1_1, e1_2, e1_3, e1_4, e2_1, e2_2, e2_3, e2_4, e3_1, e3_2, e3_3, e3_4, e4_1, e4_2, e4_3, e4_4) end

---Resets the Transform to the specified transformation parameters.
---@param x number @The position of the Transform on the x-axis.
---@param y number @The position of the Transform on the y-axis.
---@param angle? number @The orientation of the Transform in radians.
---@param sx? number @Scale factor on the x-axis.
---@param sy? number @Scale factor on the y-axis.
---@param ox? number @Origin offset on the x-axis.
---@param oy? number @Origin offset on the y-axis.
---@param kx? number @Shearing / skew factor on the x-axis.
---@param ky? number @Shearing / skew factor on the y-axis.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:setTransformation(x, y, angle, sx, sy, ox, oy, kx, ky) end

---Applies a shear factor (skew) to the Transform's coordinate system. This method does not reset any previously applied transformations.
---@param kx number @The shear factor along the x-axis.
---@param ky number @The shear factor along the y-axis.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:shear(kx, ky) end

---Applies the Transform object's transformation to the given 2D position.
---
---This effectively converts the given position from global coordinates into the local coordinate space of the Transform.
---@param globalX number @The x component of the position in global coordinates.
---@param globalY number @The y component of the position in global coordinates.
---@return number localX The x component of the position with the transform applied.
---@return number localY The y component of the position with the transform applied.
function Transform:transformPoint(globalX, globalY) end

---Applies a translation to the Transform's coordinate system. This method does not reset any previously applied transformations.
---@param dx number @The relative translation along the x-axis.
---@param dy number @The relative translation along the y-axis.
---@return Transform transform The Transform object the method was called on. Allows easily chaining Transform methods.
function Transform:translate(dx, dy) end

--endregion Transform

---The layout of matrix elements (row-major or column-major).
---@alias MatrixLayout
---| 'row'	#The matrix is row-major:
---| 'column'	#The matrix is column-major:



--love12 patch begin

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


--love12 patch end

return m