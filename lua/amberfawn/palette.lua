-- AmberFawn Color Palette
-- Defines the core color palette for the AmberFawn colorscheme
-- Author: Generated for Neovim
-- License: MIT

local M = {}

-- Main color palette
M.colors = {
    -- Core background and foreground
    bg = '#101010', -- Deep warm brown background
    fg = '#e8dcc6', -- Warm off-white foreground

    -- Background variations
    bg_alt = '#121212',       -- Slightly lighter background
    bg_highlight = '#151515', -- Highlighted background
    bg_visual = '#143052',    -- Visual selection background
    bg_sidebar = '#1e1a15',   -- Sidebar background
    bg_float = '#252017',     -- Floating window background

    -- Amber tones (primary accent)
    amber = '#C2480A',        -- Main amber
    amber_bright = '#B84B14', -- Bright amber
    amber_dim = '#88401C',    -- Dimmed amber
    amber_dark = '#742904',   -- Dark amber

    -- Fawn tones (secondary accent)
    fawn = '#d4a574',       -- Main fawn
    fawn_light = '#e6bf8a', -- Light fawn
    fawn_dark = '#b8935f',  -- Dark fawn
    fawn_dim = '#a6825c',   -- Dimmed fawn

    -- Supporting colors
    red = '#e06c75',           -- Error red
    red_bright = '#ff7a85',    -- Bright red
    red_dim = '#be5046',       -- Dimmed red
    red_dark = '#a04753',      -- Dark red

    green = '#98c379',         -- Success green
    green_bright = '#a8d389',  -- Bright green
    green_dim = '#7a9f60',     -- Dimmed green
    green_dark = '#6b8a4a',    -- Dark green

    blue = '#61afef',          -- Info blue
    blue_bright = '#71bfff',   -- Bright blue
    blue_dim = '#4e88c7',      -- Dimmed blue
    blue_dark = '#3e6ca5',     -- Dark blue

    purple = '#c678dd',        -- Purple accent
    purple_bright = '#d688ed', -- Bright purple
    purple_dim = '#a06cb8',    -- Dimmed purple
    purple_dark = '#8c5aa0',   -- Dark purple
    purple_pitch = '#A633CC',

    cyan = '#56b6c2',          -- Cyan accent
    cyan_bright = '#66c6d2',   -- Bright cyan
    cyan_dim = '#4a9ca8',      -- Dimmed cyan
    cyan_dark = '#3e8390',     -- Dark cyan

    orange = '#d19a66',        -- Orange accent
    orange_bright = '#e1aa76', -- Bright orange
    orange_dim = '#b8824e',    -- Dimmed orange
    orange_dark = '#a66e42',   -- Dark orange

    yellow = '#e5c07b',        -- Yellow accent
    yellow_bright = '#f5d08b', -- Bright yellow
    yellow_dim = '#cc9a55',    -- Dimmed yellow
    yellow_dark = '#b8862e',   -- Dark yellow

    -- Grays and neutrals
    gray = '#5c6370',         -- Comments
    gray_light = '#7c7c7c',   -- Lighter gray
    gray_lighter = '#8c8c8c', -- Even lighter gray
    gray_dark = '#3e4452',    -- Darker gray
    gray_darker = '#2e3440',  -- Even darker gray

    -- Whites
    white = '#ffffff',     -- Pure white
    white_dim = '#f0f0f0', -- Dimmed white

    -- Special
    none = 'NONE',
    transparent = 'NONE',
}

-- Color variations for different contexts
M.variants = {
    -- Bright variants for high contrast
    bright = {
        amber = M.colors.amber_bright,
        fawn = M.colors.fawn_light,
        red = M.colors.red_bright,
        green = M.colors.green_bright,
        blue = M.colors.blue_bright,
        purple = M.colors.purple_bright,
        cyan = M.colors.cyan_bright,
        orange = M.colors.orange_bright,
        yellow = M.colors.yellow_bright,
    },

    -- Dim variants for subtle accents
    dim = {
        amber = M.colors.amber_dim,
        fawn = M.colors.fawn_dim,
        red = M.colors.red_dim,
        green = M.colors.green_dim,
        blue = M.colors.blue_dim,
        purple = M.colors.purple_dim,
        cyan = M.colors.cyan_dim,
        orange = M.colors.orange_dim,
        yellow = M.colors.yellow_dim,
    },

    -- Dark variants for backgrounds
    dark = {
        amber = M.colors.amber_dark,
        fawn = M.colors.fawn_dark,
        red = M.colors.red_dark,
        green = M.colors.green_dark,
        blue = M.colors.blue_dark,
        purple = M.colors.purple_dark,
        cyan = M.colors.cyan_dark,
        orange = M.colors.orange_dark,
        yellow = M.colors.yellow_dark,
    },
}

-- Semantic color mappings
M.semantic = {
    -- Status colors
    error = M.colors.red,
    warning = M.colors.orange,
    info = M.colors.blue,
    hint = M.colors.gray_light,
    success = M.colors.green,

    -- Git colors
    added = M.colors.green,
    modified = M.colors.orange,
    removed = M.colors.red,

    -- Syntax highlighting
    keyword = M.colors.amber,
    string = M.colors.green,
    number = M.colors.orange,
    boolean = M.colors.orange,
    operator = M.colors.fawn,
    function_name = M.colors.blue,
    type = M.colors.cyan,
    variable = M.colors.fg,
    comment = M.colors.gray,
    constant = M.colors.orange,
    property = M.colors.fawn,
    parameter = M.colors.fawn_light,
}

-- Function to get a color with fallback
function M.get_color(name, fallback)
    return M.colors[name] or fallback or M.colors.fg
end

-- Function to create color variations
function M.lighten(color, amount)
    -- Simple lighten function (would need proper color manipulation)
    return color
end

function M.darken(color, amount)
    -- Simple darken function (would need proper color manipulation)
    return color
end

-- Function to blend two colors
function M.blend(color1, color2, ratio)
    -- Simple blend function (would need proper color manipulation)
    return color1
end

return M
