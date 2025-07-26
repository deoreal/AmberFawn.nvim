-- AmberFawn Treesitter Highlights
-- Treesitter-optimized syntax highlighting for the AmberFawn colorscheme
-- Author: Generated for Neovim
-- License: MIT

local M = {}

-- Apply treesitter highlights using the provided palette and highlight function
function M.setup(colors, hl)
    -- Literals and constants
    hl('@string', { fg = colors.green })
    hl('@string.documentation', { fg = colors.green_dim, italic = true })
    hl('@string.regex', { fg = colors.orange })
    hl('@string.escape', { fg = colors.orange })
    hl('@string.special', { fg = colors.fawn_light })
    hl('@string.special.symbol', { fg = colors.cyan })
    hl('@string.special.url', { fg = colors.blue, underline = false })
    hl('@character', { fg = colors.green })
    hl('@character.special', { fg = colors.orange })
    hl('@boolean', { fg = colors.orange, bold = true })
    hl('@number', { fg = colors.orange })
    hl('@number.float', { fg = colors.orange })
    hl('@float', { fg = colors.orange })

    -- Functions and methods
    hl('@function', { fg = colors.blue })
    hl('@function.builtin', { fg = colors.blue_dim, bold = true })
    hl('@function.call', { fg = colors.blue })
    hl('@function.macro', { fg = colors.purple })
    hl('@function.method', { fg = colors.blue })
    hl('@function.method.call', { fg = colors.blue })
    hl('@method', { fg = colors.blue })
    hl('@method.call', { fg = colors.blue })
    hl('@constructor', { fg = colors.cyan, bold = true })
    hl('@parameter', { fg = colors.fawn_light })
    hl('@parameter.builtin', { fg = colors.fawn_dark })

    -- Keywords and control flow
    hl('@keyword', { fg = colors.amber, bold = true })
    hl('@keyword.function', { fg = colors.amber, bold = true })
    hl('@keyword.operator', { fg = colors.amber })
    hl('@keyword.return', { fg = colors.amber, bold = true })
    hl('@keyword.import', { fg = colors.purple })
    hl('@keyword.export', { fg = colors.purple })
    hl('@keyword.storage', { fg = colors.amber })
    hl('@keyword.modifier', { fg = colors.amber_dim })
    hl('@keyword.repeat', { fg = colors.amber, bold = true })
    hl('@keyword.conditional', { fg = colors.amber, bold = true })
    hl('@keyword.exception', { fg = colors.red, bold = true })
    hl('@keyword.directive', { fg = colors.purple })
    hl('@keyword.directive.define', { fg = colors.purple })
    hl('@conditional', { fg = colors.amber, bold = true })
    hl('@conditional.ternary', { fg = colors.amber })
    hl('@repeat', { fg = colors.amber, bold = true })
    hl('@debug', { fg = colors.red })
    hl('@label', { fg = colors.amber })
    hl('@include', { fg = colors.purple })
    hl('@exception', { fg = colors.red, bold = true })

    -- Types and type annotations
    hl('@type', { fg = colors.cyan })
    hl('@type.builtin', { fg = colors.cyan, bold = true })
    hl('@type.definition', { fg = colors.cyan })
    hl('@type.qualifier', { fg = colors.amber_dim })
    hl('@storageclass', { fg = colors.amber })
    hl('@attribute', { fg = colors.purple })
    hl('@property', { fg = colors.fawn })
    hl('@field', { fg = colors.fawn })

    -- Variables and identifiers
    hl('@variable', { fg = colors.fg })
    hl('@variable.builtin', { fg = colors.fawn_dark, bold = true })
    hl('@variable.parameter', { fg = colors.fawn_light })
    hl('@variable.member', { fg = colors.fawn })
    hl('@constant', { fg = colors.orange, bold = true })
    hl('@constant.builtin', { fg = colors.orange, bold = true })
    hl('@constant.macro', { fg = colors.purple })
    hl('@module', { fg = colors.cyan })
    hl('@namespace', { fg = colors.cyan })
    hl('@symbol', { fg = colors.fawn })

    -- Operators and punctuation
    hl('@operator', { fg = colors.purple_pitch })
    hl('@punctuation.delimiter', { fg = colors.fawn })
    hl('@punctuation.bracket', { fg = colors.fawn })
    hl('@punctuation.special', { fg = colors.orange })

    -- Comments and documentation
    hl('@comment', { fg = colors.gray, italic = true })
    hl('@comment.documentation', { fg = colors.gray_light, italic = true })
    hl('@comment.error', { fg = colors.red, bg = colors.bg_alt, bold = true })
    hl('@comment.warning', { fg = colors.orange, bg = colors.bg_alt, bold = true })
    hl('@comment.todo', { fg = colors.amber, bg = colors.bg_alt, bold = true })
    hl('@comment.note', { fg = colors.blue, bg = colors.bg_alt, bold = true })

    -- Text and markup (for markdown, etc.)
    hl('@text', { fg = colors.fg })
    hl('@text.strong', { fg = colors.fg, bold = true })
    hl('@text.emphasis', { fg = colors.fg, italic = true })
    hl('@text.underline', { fg = colors.fg, underline = true })
    hl('@text.strike', { fg = colors.fg, strikethrough = true })
    hl('@text.title', { fg = colors.amber, bold = true })
    hl('@text.title.1', { fg = colors.amber, bold = true })
    hl('@text.title.2', { fg = colors.fawn, bold = true })
    hl('@text.title.3', { fg = colors.blue, bold = true })
    hl('@text.title.4', { fg = colors.green, bold = true })
    hl('@text.title.5', { fg = colors.purple, bold = true })
    hl('@text.title.6', { fg = colors.orange, bold = true })
    hl('@text.literal', { fg = colors.green })
    hl('@text.quote', { fg = colors.gray_light, italic = true })
    hl('@text.uri', { fg = colors.blue, underline = false })
    hl('@text.math', { fg = colors.blue })
    hl('@text.environment', { fg = colors.purple })
    hl('@text.environment.name', { fg = colors.cyan })
    hl('@text.reference', { fg = colors.blue })
    hl('@text.todo', { fg = colors.amber, bg = colors.bg_alt, bold = true })
    hl('@text.note', { fg = colors.blue, bg = colors.bg_alt, bold = true })
    hl('@text.warning', { fg = colors.orange, bg = colors.bg_alt, bold = true })
    hl('@text.danger', { fg = colors.red, bg = colors.bg_alt, bold = true })
    hl('@text.diff.add', { fg = colors.green })
    hl('@text.diff.delete', { fg = colors.red })

    -- Tags (HTML, XML, etc.)
    hl('@tag', { fg = colors.fawn })
    hl('@tag.attribute', { fg = colors.fawn_light })
    hl('@tag.delimiter', { fg = colors.fawn_dark })

    -- Conceal and special
    hl('@conceal', { fg = colors.gray })
    hl('@none', { fg = colors.none })
    hl('@error', { fg = colors.red, bold = true })

    -- Language-specific highlights

    -- Lua
    hl('@function.builtin.lua', { fg = colors.blue_dim, bold = true })
    hl('@constructor.lua', { fg = colors.cyan })

    -- Python
    hl('@variable.builtin.python', { fg = colors.purple, italic = true })
    hl('@function.builtin.python', { fg = colors.blue_dim })
    hl('@constant.builtin.python', { fg = colors.purple })

    -- JavaScript/TypeScript
    hl('@variable.builtin.javascript', { fg = colors.purple, italic = true })
    hl('@variable.builtin.typescript', { fg = colors.purple, italic = true })
    hl('@constructor.javascript', { fg = colors.cyan })
    hl('@constructor.typescript', { fg = colors.cyan })

    -- Rust
    hl('@attribute.rust', { fg = colors.purple })
    hl('@type.rust', { fg = colors.cyan, bold = true })
    hl('@function.macro.rust', { fg = colors.purple, bold = true })

    -- Go
    hl('@function.builtin.go', { fg = colors.blue_dim })
    hl('@type.builtin.go', { fg = colors.cyan, bold = true })

    -- C/C++
    hl('@constant.macro.c', { fg = colors.purple, bold = true })
    hl('@constant.macro.cpp', { fg = colors.purple, bold = true })
    hl('@type.builtin.c', { fg = colors.cyan, bold = true })
    hl('@type.builtin.cpp', { fg = colors.cyan, bold = true })

    -- HTML
    hl('@tag.html', { fg = colors.amber_dim })
    hl('@tag.attribute.html', { fg = colors.fawn })
    hl('@string.special.url.html', { fg = colors.blue, underline = false })

    -- CSS
    hl('@property.css', { fg = colors.fawn })
    hl('@string.css', { fg = colors.green })
    hl('@number.css', { fg = colors.orange })

    -- JSON
    hl('@label.json', { fg = colors.fawn })
    hl('@string.json', { fg = colors.green })

    -- YAML
    hl('@field.yaml', { fg = colors.fawn })
    hl('@string.yaml', { fg = colors.green })

    -- SQL
    hl('@keyword.sql', { fg = colors.amber, bold = true })
    hl('@function.builtin.sql', { fg = colors.blue_dim, bold = true })

    -- Bash/Shell
    hl('@function.builtin.bash', { fg = colors.blue_dim })
    hl('@variable.builtin.bash', { fg = colors.purple })

    -- Git commit
    hl('@text.title.gitcommit', { fg = colors.amber, bold = true })
    hl('@comment.gitcommit', { fg = colors.gray, italic = true })

    -- Vim/Lua configuration
    hl('@variable.builtin.vim', { fg = colors.purple })
    hl('@function.builtin.vim', { fg = colors.blue_dim })

    -- Markdown specific
    hl('@text.title.1.markdown', { fg = colors.amber, bold = true })
    hl('@text.title.2.markdown', { fg = colors.fawn, bold = true })
    hl('@text.title.3.markdown', { fg = colors.blue, bold = true })
    hl('@text.title.4.markdown', { fg = colors.green, bold = true })
    hl('@text.title.5.markdown', { fg = colors.purple, bold = true })
    hl('@text.title.6.markdown', { fg = colors.orange, bold = true })
    hl('@text.literal.markdown_inline', { fg = colors.green })
    hl('@text.uri.markdown_inline', { fg = colors.blue, underline = false })

    -- Additional semantic highlighting for better code readability
    hl('@lsp.type.class', { fg = colors.cyan })
    hl('@lsp.type.decorator', { fg = colors.purple })
    hl('@lsp.type.enum', { fg = colors.cyan })
    hl('@lsp.type.enumMember', { fg = colors.orange })
    hl('@lsp.type.function', { fg = colors.blue })
    hl('@lsp.type.interface', { fg = colors.cyan })
    hl('@lsp.type.macro', { fg = colors.purple })
    hl('@lsp.type.method', { fg = colors.blue })
    hl('@lsp.type.namespace', { fg = colors.cyan })
    hl('@lsp.type.parameter', { fg = colors.fawn_light })
    hl('@lsp.type.property', { fg = colors.fawn })
    hl('@lsp.type.struct', { fg = colors.cyan })
    hl('@lsp.type.type', { fg = colors.cyan })
    hl('@lsp.type.typeParameter', { fg = colors.cyan })
    hl('@lsp.type.variable', { fg = colors.fg })

    -- LSP modifiers
    hl('@lsp.mod.readonly', { italic = true })
    hl('@lsp.mod.deprecated', { strikethrough = true })
    hl('@lsp.mod.defaultLibrary', { fg = colors.blue_dim })
end

-- Function to get treesitter highlight groups that should be italic
function M.get_italic_groups()
    return {
        '@comment',
        '@comment.documentation',
        '@string.documentation',
        '@variable.builtin.python',
        '@variable.builtin.javascript',
        '@variable.builtin.typescript',
        '@text.emphasis',
        '@text.quote',
        '@lsp.mod.readonly',
    }
end

-- Function to get treesitter highlight groups that should be bold
function M.get_bold_groups()
    return {
        '@boolean',
        '@keyword',
        '@keyword.function',
        '@keyword.return',
        '@keyword.repeat',
        '@keyword.conditional',
        '@keyword.exception',
        '@conditional',
        '@repeat',
        '@exception',
        '@function.builtin',
        '@type.builtin',
        '@constant',
        '@constant.builtin',
        '@variable.builtin',
        '@constructor',
        '@text.strong',
        '@text.title',
        '@error',
    }
end

return M
