--- @meta love.font


--- @class love.font
local m = {}


--- True Type hinting mode.
--- @alias HintingMode
---| 'normal' #Default hinting. Should be preferred for typical antialiased fonts.
---| 'light' #Results in fuzzier text but can sometimes preserve the original glyph shapes of the text better than normal hinting.
---| 'mono' #Results in aliased / unsmoothed text with either full opacity or completely transparent pixels. Should be used when antialiasing is not desired for the font.
---| 'none' #Disables hinting for the font. Results in fuzzier text.













return m