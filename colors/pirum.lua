local M = {}

function M.setup()
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.termguicolors = true
vim.g.colors_name = "pirum"

local bg = "#282c34"
local fg = "#abb2bf"

local purple = "#7e57c2"
local blue = "#7a94ec"
local cyan = "#d4d364"
local green = "#8dcc7a"
local orange = "#c47264"
local number = "#e9b066"
local comment = "#5e5e5e"
local red = "#EF5350"
local yellow = "#FFCA28"

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- =====================
-- UI
-- =====================

hl("Normal", { fg = fg, bg = bg })
hl("NormalFloat", { bg = "#292D3E" })

hl("CursorLine", { bg = "#2c313a" })
hl("CursorColumn", { bg = "#2c313a" })

hl("LineNr", { fg = "#4c5374" })
hl("CursorLineNr", { fg = "#eeffff", bold = true })

hl("Visual", { bg = "#4b5370" })              -- antes #7580B850
hl("Search", { bg = "#4a3a6a" })              -- antes #7e57c25a
hl("IncSearch", { bg = purple, fg = "#ffffff" })

hl("StatusLine", { bg = "#282C3D", fg = "#676E95" })
hl("VertSplit", { fg = "#282B3C" })

-- =====================
-- Syntax
-- =====================

hl("Comment", { fg = comment, italic = true })
hl("String", { fg = green })
hl("Number", { fg = number })
hl("Boolean", { fg = number })
hl("Constant", { fg = orange })

hl("Identifier", { fg = "#b4b4b4" })
hl("Function", { fg = blue, italic = true })
hl("Keyword", { fg = cyan, italic = true })
hl("Statement", { fg = cyan, italic = true })
hl("Operator", { fg = orange })
hl("Type", { fg = blue, italic = true })
hl("Special", { fg = orange })

hl("Title", { fg = blue, bold = true, italic = true })
hl("Underlined", { underline = true })

-- =====================
-- Treesitter
-- =====================

hl("@comment", { link = "Comment" })
hl("@string", { link = "String" })
hl("@number", { link = "Number" })
hl("@constant", { link = "Constant" })
hl("@function", { link = "Function" })
hl("@keyword", { link = "Keyword" })
hl("@type", { link = "Type" })
hl("@operator", { link = "Operator" })
hl("@variable", { fg = "#b4b4b4" })
hl("@property", { fg = orange })
hl("@field", { fg = orange })

-- =====================
-- Diagnostics
-- =====================

hl("DiagnosticError", { fg = red })
hl("DiagnosticWarn", { fg = yellow })
hl("DiagnosticInfo", { fg = blue })
hl("DiagnosticHint", { fg = cyan })

hl("DiagnosticUnderlineError", { undercurl = true, sp = red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = yellow })

-- =====================
-- Diff (mezclado real)
-- =====================

hl("DiffAdd", { bg = "#344434" })      -- antes #99b76d23
hl("DiffDelete", { bg = "#4a2d30" })   -- antes #ef535033
hl("DiffChange", { bg = "#3a3550" })   -- antes #7e57c25a

-- =====================
-- Popup / Completion
-- =====================

hl("Pmenu", { bg = "#2C3043", fg = "#bfc7d5" })
hl("PmenuSel", { bg = purple, fg = "#ffffff" })
hl("FloatBorder", { fg = purple })

-- =====================
-- Git
-- =====================

hl("GitSignsAdd", { fg = "#9CCC65" })
hl("GitSignsChange", { fg = "#e2b93d" })
hl("GitSignsDelete", { fg = red })


end

M.setup()
return M
