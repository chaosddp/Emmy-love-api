--- @meta love.graphics


--- @class love.graphics
local m = {}


--- Text alignment.
--- @alias AlignMode
---| 'center' #Align text center.
---| 'left' #Align text left.
---| 'right' #Align text right.
---| 'justify' #Align text both left and right.


--- Different types of arcs that can be drawn.
--- @alias ArcType
---| 'pie' #The arc is drawn like a slice of pie, with the arc circle connected to the center at its end-points.
---| 'open' #The arc circle's two end-points are unconnected when the arc is drawn as a line. Behaves like the "closed" arc type when the arc is drawn in filled mode.
---| 'closed' #The arc circle's two end-points are connected to each other.


--- Types of particle area spread distribution.
--- @alias AreaSpreadDistribution
---| 'uniform' #Uniform distribution.
---| 'normal' #Normal (gaussian) distribution.
---| 'ellipse' #Uniform distribution in an ellipse.
---| 'borderellipse' #Distribution in an ellipse with particles spawning at the edges of the ellipse.
---| 'borderrectangle' #Distribution in a rectangle with particles spawning at the edges of the rectangle.
---| 'none' #No distribution - area spread is disabled.


--- Different ways alpha affects color blending. See BlendMode and the BlendMode Formulas for additional notes.
--- @alias BlendAlphaMode
---| 'alphamultiply' #The RGB values of what's drawn are multiplied by the alpha values of those colors during blending. This is the default alpha mode.
---| 'premultiplied' #The RGB values of what's drawn are '''not''' multiplied by the alpha values of those colors during blending. For most blend modes to work correctly with this alpha mode, the colors of a drawn object need to have had their RGB values multiplied by their alpha values at some point previously ("premultiplied alpha").


--- Different ways to do color blending. See BlendAlphaMode and the BlendMode Formulas for additional notes.
--- @alias BlendMode
---| 'alpha' #Alpha blending (normal). The alpha of what's drawn determines its opacity.
---| 'replace' #The colors of what's drawn completely replace what was on the screen, with no additional blending. The BlendAlphaMode specified in love.graphics.setBlendMode still affects what happens.
---| 'screen' #'Screen' blending.
---| 'add' #The pixel colors of what's drawn are added to the pixel colors already on the screen. The alpha of the screen is not modified.
---| 'subtract' #The pixel colors of what's drawn are subtracted from the pixel colors already on the screen. The alpha of the screen is not modified.
---| 'multiply' #The pixel colors of what's drawn are multiplied with the pixel colors already on the screen (darkening them). The alpha of drawn objects is multiplied with the alpha of the screen rather than determining how much the colors on the screen are affected, even when the "alphamultiply" BlendAlphaMode is used.
---| 'lighten' #The pixel colors of what's drawn are compared to the existing pixel colors, and the larger of the two values for each color component is used. Only works when the "premultiplied" BlendAlphaMode is used in love.graphics.setBlendMode.
---| 'darken' #The pixel colors of what's drawn are compared to the existing pixel colors, and the smaller of the two values for each color component is used. Only works when the "premultiplied" BlendAlphaMode is used in love.graphics.setBlendMode.
---| 'additive' #Additive blend mode.
---| 'subtractive' #Subtractive blend mode.
---| 'multiplicative' #Multiply blend mode.
---| 'premultiplied' #Premultiplied alpha blend mode.


--- Different types of per-pixel stencil test and depth test comparisons. The pixels of an object will be drawn if the comparison succeeds, for each pixel that the object touches.
--- @alias CompareMode
---| 'equal' #* stencil tests: the stencil value of the pixel must be equal to the supplied value.
---* depth tests: the depth value of the drawn object at that pixel must be equal to the existing depth value of that pixel.
---| 'notequal' #* stencil tests: the stencil value of the pixel must not be equal to the supplied value.
---* depth tests: the depth value of the drawn object at that pixel must not be equal to the existing depth value of that pixel.
---| 'less' #* stencil tests: the stencil value of the pixel must be less than the supplied value.
---* depth tests: the depth value of the drawn object at that pixel must be less than the existing depth value of that pixel.
---| 'lequal' #* stencil tests: the stencil value of the pixel must be less than or equal to the supplied value.
---* depth tests: the depth value of the drawn object at that pixel must be less than or equal to the existing depth value of that pixel.
---| 'gequal' #* stencil tests: the stencil value of the pixel must be greater than or equal to the supplied value.
---* depth tests: the depth value of the drawn object at that pixel must be greater than or equal to the existing depth value of that pixel.
---| 'greater' #* stencil tests: the stencil value of the pixel must be greater than the supplied value.
---* depth tests: the depth value of the drawn object at that pixel must be greater than the existing depth value of that pixel.
---| 'never' #Objects will never be drawn.
---| 'always' #Objects will always be drawn. Effectively disables the depth or stencil test.


--- How Mesh geometry is culled when rendering.
--- @alias CullMode
---| 'back' #Back-facing triangles in Meshes are culled (not rendered). The vertex order of a triangle determines whether it is back- or front-facing.
---| 'front' #Front-facing triangles in Meshes are culled.
---| 'none' #Both back- and front-facing triangles in Meshes are rendered.


--- Controls whether shapes are drawn as an outline, or filled.
--- @alias DrawMode
---| 'fill' #Draw filled shape.
---| 'line' #Draw outlined shape.


--- How the image is filtered when scaling.
--- @alias FilterMode
---| 'linear' #Scale image with linear interpolation.
---| 'nearest' #Scale image with nearest neighbor interpolation.


--- Graphics features that can be checked for with love.graphics.getSupported.
--- @alias GraphicsFeature
---| 'clampzero' #Whether the "clampzero" WrapMode is supported.
---| 'lighten' #Whether the "lighten" and "darken" BlendModes are supported.
---| 'multicanvasformats' #Whether multiple formats can be used in the same love.graphics.setCanvas call.
---| 'glsl3' #Whether GLSL 3 Shaders can be used.
---| 'instancing' #Whether mesh instancing is supported.
---| 'fullnpot' #Whether textures with non-power-of-two dimensions can use mipmapping and the 'repeat' WrapMode.
---| 'pixelshaderhighp' #Whether pixel shaders can use "highp" 32 bit floating point numbers (as opposed to just 16 bit or lower precision).
---| 'shaderderivatives' #Whether shaders can use the dFdx, dFdy, and fwidth functions for computing derivatives.


--- Types of system-dependent graphics limits checked for using love.graphics.getSystemLimits.
--- @alias GraphicsLimit
---| 'pointsize' #The maximum size of points.
---| 'texturesize' #The maximum width or height of Images and Canvases.
---| 'multicanvas' #The maximum number of simultaneously active canvases (via love.graphics.setCanvas.)
---| 'canvasmsaa' #The maximum number of antialiasing samples for a Canvas.
---| 'texturelayers' #The maximum number of layers in an Array texture.
---| 'volumetexturesize' #The maximum width, height, or depth of a Volume texture.
---| 'cubetexturesize' #The maximum width or height of a Cubemap texture.
---| 'anisotropy' #The maximum amount of anisotropic filtering. Texture:setMipmapFilter internally clamps the given anisotropy value to the system's limit.


--- Vertex map datatype for Data variant of Mesh:setVertexMap.
--- @alias IndexDataType
---| 'uint16' #The vertex map is array of unsigned word (16-bit).
---| 'uint32' #The vertex map is array of unsigned dword (32-bit).


--- Line join style.
--- @alias LineJoin
---| 'miter' #The ends of the line segments beveled in an angle so that they join seamlessly.
---| 'none' #No cap applied to the ends of the line segments.
---| 'bevel' #Flattens the point where line segments join together.


--- The styles in which lines are drawn.
--- @alias LineStyle
---| 'rough' #Draw rough lines.
---| 'smooth' #Draw smooth lines.


--- How a Mesh's vertices are used when drawing.
--- @alias MeshDrawMode
---| 'fan' #The vertices create a "fan" shape with the first vertex acting as the hub point. Can be easily used to draw simple convex polygons.
---| 'strip' #The vertices create a series of connected triangles using vertices 1, 2, 3, then 3, 2, 4 (note the order), then 3, 4, 5, and so on.
---| 'triangles' #The vertices create unconnected triangles.
---| 'points' #The vertices are drawn as unconnected points (see love.graphics.setPointSize.)


--- Controls whether a Canvas has mipmaps, and its behaviour when it does.
--- @alias MipmapMode
---| 'none' #The Canvas has no mipmaps.
---| 'auto' #The Canvas has mipmaps. love.graphics.setCanvas can be used to render to a specific mipmap level, or Canvas:generateMipmaps can (re-)compute all mipmap levels based on the base level.
---| 'manual' #The Canvas has mipmaps, and all mipmap levels will automatically be recomputed when switching away from the Canvas with love.graphics.setCanvas.


--- How newly created particles are added to the ParticleSystem.
--- @alias ParticleInsertMode
---| 'top' #Particles are inserted at the top of the ParticleSystem's list of particles.
---| 'bottom' #Particles are inserted at the bottom of the ParticleSystem's list of particles.
---| 'random' #Particles are inserted at random positions in the ParticleSystem's list of particles.


--- Usage hints for SpriteBatches and Meshes to optimize data storage and access.
--- @alias SpriteBatchUsage
---| 'dynamic' #The object's data will change occasionally during its lifetime. 
---| 'static' #The object will not be modified after initial sprites or vertices are added.
---| 'stream' #The object data will always change between draws.


--- Graphics state stack types used with love.graphics.push.
--- @alias StackType
---| 'transform' #The transformation stack (love.graphics.translate, love.graphics.rotate, etc.)
---| 'all' #All love.graphics state, including transform state.


--- How a stencil function modifies the stencil values of pixels it touches.
--- @alias StencilAction
---| 'replace' #The stencil value of a pixel will be replaced by the value specified in love.graphics.stencil, if any object touches the pixel.
---| 'increment' #The stencil value of a pixel will be incremented by 1 for each object that touches the pixel. If the stencil value reaches 255 it will stay at 255.
---| 'decrement' #The stencil value of a pixel will be decremented by 1 for each object that touches the pixel. If the stencil value reaches 0 it will stay at 0.
---| 'incrementwrap' #The stencil value of a pixel will be incremented by 1 for each object that touches the pixel. If a stencil value of 255 is incremented it will be set to 0.
---| 'decrementwrap' #The stencil value of a pixel will be decremented by 1 for each object that touches the pixel. If the stencil value of 0 is decremented it will be set to 255.
---| 'invert' #The stencil value of a pixel will be bitwise-inverted for each object that touches the pixel. If a stencil value of 0 is inverted it will become 255.


--- Types of textures (2D, cubemap, etc.)
--- @alias TextureType
---| '2d' #Regular 2D texture with width and height.
---| 'array' #Several same-size 2D textures organized into a single object. Similar to a texture atlas / sprite sheet, but avoids sprite bleeding and other issues.
---| 'cube' #Cubemap texture with 6 faces. Requires a custom shader (and Shader:send) to use. Sampling from a cube texture in a shader takes a 3D direction vector instead of a texture coordinate.
---| 'volume' #3D texture with width, height, and depth. Requires a custom shader to use. Volume textures can have texture filtering applied along the 3rd axis.


--- The frequency at which a vertex shader fetches the vertex attribute's data from the Mesh when it's drawn.
---
---Per-instance attributes can be used to render a Mesh many times with different positions, colors, or other attributes via a single love.graphics.drawInstanced call, without using the love_InstanceID vertex shader variable.
--- @alias VertexAttributeStep
---| 'pervertex' #The vertex attribute will have a unique value for each vertex in the Mesh.
---| 'perinstance' #The vertex attribute will have a unique value for each instance of the Mesh.


--- How Mesh geometry vertices are ordered.
--- @alias VertexWinding
---| 'cw' #Clockwise.
---| 'ccw' #Counter-clockwise.


--- How the image wraps inside a Quad with a larger quad size than image size. This also affects how Meshes with texture coordinates which are outside the range of 1 are drawn, and the color returned by the Texel Shader function when using it to sample from texture coordinates outside of the range of 1.
--- @alias WrapMode
---| 'clamp' #Clamp the texture. Appears only once. The area outside the texture's normal range is colored based on the edge pixels of the texture.
---| 'repeat' #Repeat the texture. Fills the whole available extent.
---| 'mirroredrepeat' #Repeat the texture, flipping it each time it repeats. May produce better visual results than the repeat mode when the texture doesn't seamlessly tile.
---| 'clampzero' #Clamp the texture. Fills the area outside the texture's normal range with transparent black (or opaque black for textures with no alpha channel.)













return m