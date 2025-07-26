-- Example configuration for AmberFawn colorscheme
-- Copy this to your Neovim configuration and customize as needed

-- Basic setup with default options
require("amberfawn").setup()
vim.cmd([[colorscheme amberfawn]])

-- Advanced configuration example
require("amberfawn").setup({
    -- Style options
    style = "dark", -- Only dark theme available currently

    -- Transparency
    transparent = false,    -- Set to true for transparent background
    terminal_colors = true, -- Enable terminal color integration

    -- Style preferences
    italic_comments = true,   -- Make comments italic
    italic_keywords = false,  -- Keep keywords non-italic
    italic_functions = false, -- Keep functions non-italic
    italic_variables = false, -- Keep variables non-italic

    -- Contrast and accessibility
    contrast = "medium",  -- Options: "low", "medium", "high"
    dim_inactive = false, -- Dim inactive windows

    -- Plugin integrations - disable any you don't use
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

    -- Custom color overrides
    colors = {
        -- Override any color from the palette
        -- amber = "#ffcc55",
        -- fawn = "#cc9966",
        -- bg = "#000000",
    },

    -- Custom highlight overrides
    overrides = {
        -- Override specific highlight groups
        -- Normal = { bg = "#000000" },
        -- Comment = { fg = "#888888", italic = true },
    },
})

-- Alternative: Use function-based overrides for more complex customization
--[[
require("amberfawn").setup({
  overrides = function(colors, highlight, config)
    return {
      -- Custom highlights based on the color palette
      MyCustomGroup = { fg = colors.amber, bg = colors.bg_alt, bold = true },
      ["@string.special"] = { fg = colors.fawn_light, italic = true },
      -- Conditional highlights based on config
      Normal = config.transparent and { fg = colors.fg } or { fg = colors.fg, bg = colors.bg },
    }
  end,
})
--]]

-- Set the colorscheme
vim.cmd([[colorscheme amberfawn]])

-- Optional: Create some useful commands for toggling features
vim.api.nvim_create_user_command('AmberFawnToggleTransparency', function()
    require('amberfawn').toggle_transparency()
end, { desc = 'Toggle AmberFawn transparency' })

vim.api.nvim_create_user_command('AmberFawnToggleItalicComments', function()
    require('amberfawn').toggle_italic_comments()
end, { desc = 'Toggle AmberFawn italic comments' })

vim.api.nvim_create_user_command('AmberFawnSetContrast', function(opts)
    require('amberfawn').set_contrast(opts.args)
end, {
    desc = 'Set AmberFawn contrast level',
    nargs = 1,
    complete = function()
        return { 'low', 'medium', 'high' }
    end
})

-- Optional: Set up autocmds for different file types
local augroup = vim.api.nvim_create_augroup('AmberFawnCustom', { clear = true })

-- Example: Different highlight for specific file types
vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    pattern = { 'markdown', 'text' },
    callback = function()
        -- Custom highlights for markdown files
        vim.api.nvim_set_hl(0, '@text.title.1.markdown', { fg = '#ffbf47', bold = true })
        vim.api.nvim_set_hl(0, '@text.title.2.markdown', { fg = '#d4a574', bold = true })
    end,
})

-- Example: Custom lualine configuration with AmberFawn colors
--[[
local colors = require('amberfawn').colors

require('lualine').setup({
  options = {
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.amber, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg_highlight },
        c = { fg = colors.gray_light, bg = colors.bg_alt },
      },
      insert = { a = { fg = colors.bg, bg = colors.green, gui = 'bold' } },
      visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
      command = { a = { fg = colors.bg, bg = colors.orange, gui = 'bold' } },
      inactive = {
        a = { fg = colors.gray, bg = colors.bg_alt },
        b = { fg = colors.gray, bg = colors.bg_alt },
        c = { fg = colors.gray, bg = colors.bg_alt },
      },
    },
  },
})
--]]

-- Example: Telescope configuration with AmberFawn colors
--[[
local colors = require('amberfawn').colors

require('telescope').setup({
  defaults = {
    prompt_prefix = '🔍 ',
    selection_caret = '▶ ',
    winblend = 0,
    color_devicons = true,
  },
})
--]]
