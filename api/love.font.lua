--- @meta love.font


--- @class love.font
local m = {}


--- True Type hinting mode.
--- @alias HintingMode
---| 'normal' #Default hinting. Should be preferred for typical antialiased fonts.
---| 'light' #Results in fuzzier text but can sometimes preserve the original glyph shapes of the text better than normal hinting.
---| 'mono' #Results in aliased / unsmoothed text with either full opacity or completely transparent pixels. Should be used when antialiasing is not desired for the font.
---| 'none' #Disables hinting for the font. Results in fuzzier text.




--- @class GlyphData: Data, Object
--- A GlyphData represents a drawable symbol of a font Rasterizer.
local GlyphData = {}

--- Gets glyph advance.
--- @return number @Glyph advance.
function GlyphData:getAdvance() end


--- Gets glyph bearing.
--- @return number @Glyph bearing X.
--- @return number @Glyph bearing Y.
function GlyphData:getBearing() end


--- Gets glyph bounding box.
--- @return number @Glyph position x.
--- @return number @Glyph position y.
--- @return number @Glyph width.
--- @return number @Glyph height.
function GlyphData:getBoundingBox() end


--- Gets glyph dimensions.
--- @return number @Glyph width.
--- @return number @Glyph height.
function GlyphData:getDimensions() end


--- Gets glyph pixel format.
--- @return PixelFormat @Glyph pixel format.
function GlyphData:getFormat() end


--- Gets glyph number.
--- @return number @Glyph number.
function GlyphData:getGlyph() end


--- Gets glyph string.
--- @return string @Glyph string.
function GlyphData:getGlyphString() end


--- Gets glyph height.
--- @return number @Glyph height.
function GlyphData:getHeight() end


--- Gets glyph width.
--- @return number @Glyph width.
function GlyphData:getWidth() end


--- @class Rasterizer: Object
--- A Rasterizer handles font rendering, containing the font data (image or TrueType font) and drawable glyphs.
local Rasterizer = {}

--- Gets font advance.
--- @return number @Font advance.
function Rasterizer:getAdvance() end


--- Gets ascent height.
--- @return number @Ascent height.
function Rasterizer:getAscent() end


--- Gets descent height.
--- @return number @Descent height.
function Rasterizer:getDescent() end


--- Gets number of glyphs in font.
--- @return number @Glyphs count.
function Rasterizer:getGlyphCount() end


--- Gets glyph data of a specified glyph.
--- @param glyph string @Glyph
--- @return GlyphData @Glyph data
--- @overload fun(glyphNumber: number):GlyphData
function Rasterizer:getGlyphData(glyph) end


--- Gets font height.
--- @return number @Font height
function Rasterizer:getHeight() end


--- Gets line height of a font.
--- @return number @Line height of a font.
function Rasterizer:getLineHeight() end


--- Checks if font contains specified glyphs.
--- @param glyph1 string|number @Glyph
--- @param ... string|number @Additional glyphs
--- @return boolean @Whatever font contains specified glyphs.
function Rasterizer:hasGlyphs(glyph1, ...) end







--- Creates a new BMFont Rasterizer.
--- @param imageData ImageData @The image data containing the drawable pictures of font glyphs.
--- @param glyphs string @The sequence of glyphs in the ImageData.
--- @param dpiscale number @DPI scale.
--- @return Rasterizer @The rasterizer.
--- @overload fun(fileName: string, glyphs: string, dpiscale: number):Rasterizer
function m.newBMFontRasterizer(imageData, glyphs, dpiscale) end


--- Creates a new GlyphData.
--- @param rasterizer Rasterizer @The Rasterizer containing the font.
--- @param glyph number @The character code of the glyph.
function m.newGlyphData(rasterizer, glyph) end


--- Creates a new Image Rasterizer.
--- @param imageData ImageData @Font image data.
--- @param glyphs string @String containing font glyphs.
--- @param extraSpacing number @Font extra spacing.
--- @param dpiscale number @Font DPI scale.
--- @return Rasterizer @The rasterizer.
function m.newImageRasterizer(imageData, glyphs, extraSpacing, dpiscale) end


--- Creates a new Rasterizer.
--- @param filename string @The font file.
--- @return Rasterizer @The rasterizer.
--- @overload fun(data: FileData):Rasterizer
--- @overload fun(size: number, hinting: HintingMode, dpiscale: number):Rasterizer
--- @overload fun(fileName: string, size: number, hinting: HintingMode, dpiscale: number):Rasterizer
--- @overload fun(fileData: FileData, size: number, hinting: HintingMode, dpiscale: number):Rasterizer
--- @overload fun(imageData: ImageData, glyphs: string, dpiscale: number):Rasterizer
--- @overload fun(fileName: string, glyphs: string, dpiscale: number):Rasterizer
function m.newRasterizer(filename) end


--- Creates a new TrueType Rasterizer.
--- @param size number @The font size.
--- @param hinting HintingMode @True Type hinting mode.
--- @param dpiscale number @The font DPI scale.
--- @return Rasterizer @The rasterizer.
--- @overload fun(fileName: string, size: number, hinting: HintingMode, dpiscale: number):Rasterizer
--- @overload fun(fileData: FileData, size: number, hinting: HintingMode, dpiscale: number):Rasterizer
function m.newTrueTypeRasterizer(size, hinting, dpiscale) end










return m