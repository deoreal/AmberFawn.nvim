-- AmberFawn Colorscheme Demo
-- This file demonstrates syntax highlighting with the AmberFawn colorscheme

local M = {}

-- Module configuration
M.config = {
    theme = "amberfawn",
    version = "1.0.0",
    author = "AmberFawn Team",
    features = {
        treesitter = true,
        lsp_support = true,
        plugin_integration = true,
    }
}

-- Color constants
local COLORS = {
    AMBER = "#ffbf47",
    FAWN = "#d4a574",
    BACKGROUND = "#1a1611",
    FOREGROUND = "#e8dcc6",
}

-- Example function with different syntax elements
function M.setup(opts)
    opts = opts or {}

    -- Merge user options with defaults
    M.config = vim.tbl_deep_extend("force", M.config, opts)

    -- String interpolation and escapes
    local message = string.format("Setting up %s v%s", M.config.theme, M.config.version)
    print(message .. "\n\tAuthor: " .. M.config.author)

    -- Conditional logic
    if M.config.features.treesitter then
        print("✓ Treesitter support enabled")
    else
        print("✗ Treesitter support disabled")
    end

    -- Number operations
    local opacity = 0.95
    local contrast_ratio = 4.5
    local total_plugins = 25

    -- Boolean checks
    local is_ready = true
    local has_errors = false

    -- Table operations
    local highlights = {
        normal = { fg = COLORS.FOREGROUND, bg = COLORS.BACKGROUND },
        keyword = { fg = COLORS.AMBER, bold = true },
        string = { fg = "#98c379", italic = false },
        comment = { fg = "#5c6370", italic = true },
    }

    -- Loop through highlights
    for group, style in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, style)
    end

    return M.config
end

-- Advanced function with error handling
function M.load_theme()
    local success, result = pcall(function()
        -- Try to load colorscheme
        vim.cmd([[colorscheme amberfawn]])
        return "Theme loaded successfully"
    end)

    if not success then
        vim.notify("Failed to load AmberFawn colorscheme: " .. result, vim.log.levels.ERROR)
        return false
    end

    return true
end

-- Class-like table with methods
local ColorManager = {}
ColorManager.__index = ColorManager

function ColorManager:new(palette)
    local instance = {
        palette = palette or {},
        cache = {},
        dirty = false,
    }
    setmetatable(instance, self)
    return instance
end

function ColorManager:get_color(name)
    -- Check cache first
    if self.cache[name] then
        return self.cache[name]
    end

    -- Get from palette
    local color = self.palette[name]
    if color then
        self.cache[name] = color
        return color
    end

    -- Fallback
    return "#ffffff"
end

function ColorManager:set_color(name, value)
    assert(type(name) == "string", "Color name must be a string")
    assert(type(value) == "string", "Color value must be a string")

    self.palette[name] = value
    self.cache[name] = nil -- Invalidate cache
    self.dirty = true
end

-- Example usage with different operators
local manager = ColorManager:new(COLORS)
manager:set_color("accent", "#ff6b6b")

local amber = manager:get_color("AMBER")
local is_warm = amber:match("#ff") ~= nil
local brightness = tonumber(amber:sub(2, 3), 16) / 255

-- Mathematical operations
local golden_ratio = (1 + math.sqrt(5)) / 2
local angle = math.pi / 4
local cos_val = math.cos(angle)

-- String patterns and regex-like operations
local hex_pattern = "#[0-9a-fA-F]+"
local colors_text = "Primary: #ffbf47, Secondary: #d4a574"
for color in colors_text:gmatch(hex_pattern) do
    print("Found color: " .. color)
end

-- Metatable magic
local auto_colors = setmetatable({}, {
    __index = function(t, k)
        return string.format("#%06x", math.random(0, 0xffffff))
    end,
    __newindex = function(t, k, v)
        rawset(t, k, v:upper())
    end
})

-- File I/O simulation
function M.save_config(filepath)
    local file = io.open(filepath, "w")
    if not file then
        error("Cannot open file for writing: " .. filepath)
    end

    file:write("-- AmberFawn Configuration\n")
    file:write("return " .. vim.inspect(M.config))
    file:close()
end

-- Async-style function with coroutines
function M.animate_colors()
    return coroutine.create(function()
        local steps = 10
        for i = 1, steps do
            local progress = i / steps
            local alpha = math.sin(progress * math.pi)

            coroutine.yield({
                step = i,
                progress = progress,
                alpha = alpha,
                color = string.format("#%02x%02x%02x",
                    math.floor(255 * alpha),
                    math.floor(180 * alpha),
                    math.floor(120 * alpha)
                )
            })
        end
    end)
end

-- TODO: Add light theme support
-- FIXME: Handle edge case with invalid color values
-- NOTE: This is optimized for dark backgrounds
-- HACK: Workaround for Neovim < 0.8 compatibility
-- WARNING: Experimental feature, use with caution

--[[
Multi-line comment block demonstrating
various syntax highlighting features:
- Keywords: local, function, if, then, else, end
- Types: string, number, boolean, table
- Operators: +, -, *, /, ==, ~=, and, or, not
- Literals: "strings", 123, true, false, nil
- Built-ins: print, pairs, ipairs, type, getmetatable
]]

-- Regular expressions and patterns
local patterns = {
    email = "[%w%._%+-]+@[%w%._%+-]+%.%a+",
    hex_color = "#[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]",
    lua_identifier = "[%a_][%w_]*",
}

-- Module exports
M.ColorManager = ColorManager
M.COLORS = COLORS
M.patterns = patterns

return M
