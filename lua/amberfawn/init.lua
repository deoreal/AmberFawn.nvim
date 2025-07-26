-- AmberFawn colorscheme for Neovim
-- A warm, earthy colorscheme optimized for treesitter syntax highlighting
-- Author: Generated for Neovim
-- License: MIT

local M = {}

-- Import modules
local palette = require('amberfawn.palette')
local utils = require('amberfawn.utils')
local treesitter = require('amberfawn.treesitter')
local plugins = require('amberfawn.plugins')

-- Default configuration
M.config = {
    -- Style options
    style = 'dark', -- 'dark' or 'light' (light not implemented yet)

    -- Transparency options
    transparent = false,
    terminal_colors = true,

    -- Style preferences
    italic_comments = true,
    italic_keywords = false,
    italic_functions = false,
    italic_variables = false,

    -- Contrast and accessibility
    contrast = 'medium', -- 'low', 'medium', 'high'
    dim_inactive = false,

    -- Plugin integrations
    plugins = {
        telescope = true,
        nvim_tree = true,
        neo_tree = true,
        which_key = true,
        indent_blankline = true,
        bufferline = true,
        lualine = true,
        gitsigns = true,
        notify = true,
        dashboard = true,
        lazy = true,
        mason = true,
        trouble = true,
        noice = true,
        flash = true,
        leap = true,
        hop = true,
        mini = true,
        cmp = true,
        aerial = true,
        neotest = true,
        dap = true,
        fidget = true,
        outline = true,
        navic = true,
        copilot = true,
        rainbow_delimiters = true,
        overseer = true,
    },

    -- Custom overrides
    overrides = {},

    -- Color overrides
    colors = {},
}

-- Apply user configuration
function M.setup(user_config)
    M.config = vim.tbl_deep_extend('force', M.config, user_config or {})
end

-- Get the color palette with user overrides
function M.get_colors()
    local colors = vim.tbl_deep_extend('force', palette.colors, M.config.colors or {})

    -- Apply transparency if enabled
    if M.config.transparent then
        colors.bg = 'NONE'
        colors.bg_sidebar = 'NONE'
        colors.bg_float = 'NONE'
        colors.bg_alt = 'NONE'
    end

    -- Adjust contrast if needed
    if M.config.contrast == 'high' then
        colors.fg = utils.lighten(colors.fg, 0.1)
        colors.gray = utils.lighten(colors.gray, 0.1)
    elseif M.config.contrast == 'low' then
        colors.fg = utils.darken(colors.fg, 0.1)
        colors.gray = utils.darken(colors.gray, 0.1)
    end

    return colors
end

-- Apply basic editor highlights
function M.apply_editor_highlights(colors)
    local hl = utils.highlight

    -- Basic editor colors
    hl('Normal', { fg = colors.fg, bg = colors.bg })
    hl('NormalFloat', { fg = colors.fg, bg = colors.bg_float })
    hl('FloatBorder', { fg = colors.fawn, bg = colors.bg_float })
    hl('FloatTitle', { fg = colors.amber, bg = colors.bg_float, bold = true })
    hl('Cursor', { fg = colors.bg, bg = colors.amber })
    hl('CursorLine', { bg = colors.bg_highlight })
    hl('CursorColumn', { bg = colors.bg_highlight })
    hl('LineNr', { fg = colors.gray })
    hl('CursorLineNr', { fg = colors.amber, bold = true })
    hl('SignColumn', { fg = colors.gray, bg = colors.bg })
    hl('Visual', { bg = colors.bg_visual })
    hl('VisualNOS', { bg = colors.bg_visual })
    hl('Search', { fg = colors.bg, bg = colors.amber })
    hl('IncSearch', { fg = colors.bg, bg = colors.amber_bright })
    hl('Substitute', { fg = colors.bg, bg = colors.red })
    hl('ColorColumn', { bg = colors.bg_alt })
    hl('Folded', { fg = colors.gray, bg = colors.bg_alt })
    hl('FoldColumn', { fg = colors.gray, bg = colors.bg })
    hl('Conceal', { fg = colors.gray })

    -- Window and UI elements
    hl('VertSplit', { fg = colors.gray_dark })
    hl('WinSeparator', { fg = colors.gray_dark })
    hl('StatusLine', { fg = colors.fg, bg = colors.bg_alt })
    hl('StatusLineNC', { fg = colors.gray, bg = colors.bg_alt })
    hl('TabLine', { fg = colors.gray, bg = colors.bg_alt })
    hl('TabLineFill', { bg = colors.bg_alt })
    hl('TabLineSel', { fg = colors.fg, bg = colors.bg, bold = true })
    hl('WildMenu', { fg = colors.bg, bg = colors.amber })
    hl('Pmenu', { fg = colors.fg, bg = colors.bg_float })
    hl('PmenuSel', { fg = colors.bg, bg = colors.amber })
    hl('PmenuKind', { fg = colors.purple, bg = colors.bg_float })
    hl('PmenuKindSel', { fg = colors.bg, bg = colors.purple })
    hl('PmenuExtra', { fg = colors.gray, bg = colors.bg_float })
    hl('PmenuExtraSel', { fg = colors.bg, bg = colors.gray })
    hl('PmenuSbar', { bg = colors.bg_alt })
    hl('PmenuThumb', { bg = colors.fawn })

    -- Messages and prompts
    hl('ErrorMsg', { fg = colors.red })
    hl('WarningMsg', { fg = colors.orange })
    hl('ModeMsg', { fg = colors.fawn })
    hl('MoreMsg', { fg = colors.green })
    hl('Question', { fg = colors.blue })
    hl('Title', { fg = colors.amber, bold = true })
    hl('Directory', { fg = colors.fawn })
    hl('NonText', { fg = colors.gray_dark })
    hl('EndOfBuffer', { fg = colors.gray_dark })
    hl('Whitespace', { fg = colors.gray_dark })
    hl('SpecialKey', { fg = colors.gray_dark })

    -- Spell checking
    hl('SpellBad', { sp = colors.red, undercurl = true })
    hl('SpellCap', { sp = colors.orange, undercurl = true })
    hl('SpellLocal', { sp = colors.blue, undercurl = true })
    hl('SpellRare', { sp = colors.purple, undercurl = true })

    -- Diagnostics
    hl('DiagnosticError', { fg = colors.red })
    hl('DiagnosticWarn', { fg = colors.orange })
    hl('DiagnosticInfo', { fg = colors.blue })
    hl('DiagnosticHint', { fg = colors.gray_light })
    hl('DiagnosticOk', { fg = colors.green })
    hl('DiagnosticVirtualTextError', { fg = colors.red_dim, bg = colors.none })
    hl('DiagnosticVirtualTextWarn', { fg = colors.orange_dim, bg = colors.none })
    hl('DiagnosticVirtualTextInfo', { fg = colors.blue_dim, bg = colors.none })
    hl('DiagnosticVirtualTextHint', { fg = colors.gray, bg = colors.none })
    hl('DiagnosticVirtualTextOk', { fg = colors.green_dim, bg = colors.none })
    hl('DiagnosticUnderlineError', { sp = colors.red, undercurl = true })
    hl('DiagnosticUnderlineWarn', { sp = colors.orange, undercurl = true })
    hl('DiagnosticUnderlineInfo', { sp = colors.blue, undercurl = true })
    hl('DiagnosticUnderlineHint', { sp = colors.gray_light, undercurl = true })
    hl('DiagnosticUnderlineOk', { sp = colors.green, undercurl = true })
    hl('DiagnosticFloatingError', { fg = colors.red, bg = colors.bg_float })
    hl('DiagnosticFloatingWarn', { fg = colors.orange, bg = colors.bg_float })
    hl('DiagnosticFloatingInfo', { fg = colors.blue, bg = colors.bg_float })
    hl('DiagnosticFloatingHint', { fg = colors.gray_light, bg = colors.bg_float })
    hl('DiagnosticFloatingOk', { fg = colors.green, bg = colors.bg_float })
    hl('DiagnosticSignError', { fg = colors.red, bg = colors.bg })
    hl('DiagnosticSignWarn', { fg = colors.orange, bg = colors.bg })
    hl('DiagnosticSignInfo', { fg = colors.blue, bg = colors.bg })
    hl('DiagnosticSignHint', { fg = colors.gray_light, bg = colors.bg })
    hl('DiagnosticSignOk', { fg = colors.green, bg = colors.bg })
end

-- Apply basic syntax highlights
function M.apply_syntax_highlights(colors)
    local hl = utils.highlight

    -- Comments with optional italic
    local comment_style = { fg = colors.gray }
    if M.config.italic_comments then
        comment_style.italic = true
    end
    hl('Comment', comment_style)

    -- Constants and literals
    hl('Constant', { fg = colors.orange })
    hl('String', { fg = colors.green })
    hl('Character', { fg = colors.green })
    hl('Number', { fg = colors.orange })
    hl('Boolean', { fg = colors.orange, bold = true })
    hl('Float', { fg = colors.orange })

    -- Identifiers and variables
    local variable_style = { fg = colors.fg }
    if M.config.italic_variables then
        variable_style.italic = true
    end
    hl('Identifier', variable_style)

    -- Functions
    local function_style = { fg = colors.blue }
    if M.config.italic_functions then
        function_style.italic = true
    end
    hl('Function', function_style)

    -- Statements and keywords
    local keyword_style = { fg = colors.amber, bold = true }
    if M.config.italic_keywords then
        keyword_style.italic = true
    end
    hl('Statement', keyword_style)
    hl('Conditional', keyword_style)
    hl('Repeat', keyword_style)
    hl('Label', { fg = colors.amber })
    hl('Operator', { fg = colors.fawn })
    hl('Keyword', keyword_style)
    hl('Exception', { fg = colors.red, bold = true })

    -- Preprocessor
    hl('PreProc', { fg = colors.purple })
    hl('Include', { fg = colors.purple })
    hl('Define', { fg = colors.purple })
    hl('Macro', { fg = colors.purple })
    hl('PreCondit', { fg = colors.purple })

    -- Types
    hl('Type', { fg = colors.cyan })
    hl('StorageClass', { fg = colors.amber })
    hl('Structure', { fg = colors.cyan })
    hl('Typedef', { fg = colors.cyan })

    -- Special
    hl('Special', { fg = colors.fawn_light })
    hl('SpecialChar', { fg = colors.orange })
    hl('Tag', { fg = colors.fawn })
    hl('Delimiter', { fg = colors.fawn })
    hl('SpecialComment', { fg = colors.gray_light })
    hl('Debug', { fg = colors.red })

    -- Other
    hl('Underlined', { fg = colors.blue, underline = true })
    hl('Ignore', { fg = colors.gray })
    hl('Error', { fg = colors.red, bold = true })
    hl('Todo', { fg = colors.amber, bg = colors.bg_alt, bold = true })
    hl('Added', { fg = colors.green })
    hl('Changed', { fg = colors.orange })
    hl('Removed', { fg = colors.red })
end

-- Apply window-specific highlights for inactive windows
function M.apply_inactive_highlights(colors)
    if M.config.dim_inactive then
        utils.highlight('NormalNC', { fg = utils.darken(colors.fg, 0.2), bg = colors.bg })
        utils.highlight('LineNrNC', { fg = utils.darken(colors.gray, 0.3) })
        utils.highlight('SignColumnNC', { fg = utils.darken(colors.gray, 0.3), bg = colors.bg })
    end
end

-- Set terminal colors
function M.set_terminal_colors(colors)
    if M.config.terminal_colors then
        local terminal_colors = utils.create_terminal_colors(colors)
        utils.set_terminal_colors(terminal_colors)
    end
end

-- Load the colorscheme
function M.load()
    -- Clear existing highlights
    vim.cmd('highlight clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    -- Set colorscheme name and background
    vim.g.colors_name = 'amberfawn'
    vim.o.background = M.config.style

    -- Get colors
    local colors = M.get_colors()

    -- Apply highlights
    M.apply_editor_highlights(colors)
    M.apply_syntax_highlights(colors)
    M.apply_inactive_highlights(colors)

    -- Apply treesitter highlights
    treesitter.setup(colors, utils.highlight)

    -- Apply plugin highlights if enabled
    if M.config.plugins then
        plugins.setup(colors, utils.highlight)
    end

    -- Set terminal colors
    M.set_terminal_colors(colors)

    -- Apply user overrides
    if M.config.overrides and type(M.config.overrides) == 'table' then
        utils.apply_highlights(M.config.overrides)
    end

    -- Apply user custom function if provided
    if M.config.overrides and type(M.config.overrides) == 'function' then
        M.config.overrides(colors, utils.highlight, M.config)
    end
end

-- Convenience function to get a specific color
function M.get_color(name, fallback)
    local colors = M.get_colors()
    return colors[name] or fallback or colors.fg
end

-- Function to toggle transparency
function M.toggle_transparency()
    M.config.transparent = not M.config.transparent
    M.load()
end

-- Function to set contrast level
function M.set_contrast(level)
    if level == 'low' or level == 'medium' or level == 'high' then
        M.config.contrast = level
        M.load()
    else
        vim.notify('Invalid contrast level. Use "low", "medium", or "high".', vim.log.levels.ERROR)
    end
end

-- Function to toggle italic comments
function M.toggle_italic_comments()
    M.config.italic_comments = not M.config.italic_comments
    M.load()
end

-- Export colors for external use
M.colors = palette.colors
M.palette = palette
M.utils = utils

return M
