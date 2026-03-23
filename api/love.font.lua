--- @meta love.font


--- @class love.font
local m = {}


--- True Type hinting mode.
--- @alias HintingMode
---| 'normal' #Default hinting. Should be preferred for typical antialiased fonts.
---| 'light' #Results in fuzzier text but can sometimes preserve the original glyph shapes of the text better than normal hinting.
---| 'mono' #Results in aliased / unsmoothed text with either full opacity or completely transparent pixels. Should be used when antialiasing is not desired for the font.
---| 'none' #Disables hinting for the font. Results in fuzzier text.










--- Creates a new BMFont Rasterizer.
--- Creates a new BMFont Rasterizer.
--- @param imageData ImageData @The image data containing the drawable pictures of font glyphs.
--- @param glyphs string @The sequence of glyphs in the ImageData.
--- @param dpiscale number @DPI scale.
--- @return Rasterizer @The rasterizer.
--- @overload fun(fileName: string, glyphs: string, dpiscale: number):Rasterizer
function m.newBMFontRasterizer(imageData, glyphs, dpiscale) end


--- Creates a new GlyphData.
--- Creates a new GlyphData.
--- @param rasterizer Rasterizer @The Rasterizer containing the font.
--- @param glyph number @The character code of the glyph.
function m.newGlyphData(rasterizer, glyph) end


--- Creates a new Image Rasterizer.
--- Creates a new Image Rasterizer.
--- @param imageData ImageData @Font image data.
--- @param glyphs string @String containing font glyphs.
--- @param extraSpacing number @Font extra spacing.
--- @param dpiscale number @Font DPI scale.
--- @return Rasterizer @The rasterizer.
function m.newImageRasterizer(imageData, glyphs, extraSpacing, dpiscale) end


--- Creates a new Rasterizer.
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
--- Creates a new TrueType Rasterizer.
--- @param size number @The font size.
--- @param hinting HintingMode @True Type hinting mode.
--- @param dpiscale number @The font DPI scale.
--- @return Rasterizer @The rasterizer.
--- @overload fun(fileName: string, size: number, hinting: HintingMode, dpiscale: number):Rasterizer
--- @overload fun(fileData: FileData, size: number, hinting: HintingMode, dpiscale: number):Rasterizer
function m.newTrueTypeRasterizer(size, hinting, dpiscale) end







return m