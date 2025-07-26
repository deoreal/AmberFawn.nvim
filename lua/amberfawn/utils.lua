-- AmberFawn Utilities
-- Utility functions for the AmberFawn colorscheme
-- Author: Generated for Neovim
-- License: MIT

local M = {}

-- Helper function to set highlights
function M.highlight(group, opts)
    opts = opts or {}
    local cmd = 'highlight ' .. group

    if opts.fg then cmd = cmd .. ' guifg=' .. opts.fg end
    if opts.bg then cmd = cmd .. ' guibg=' .. opts.bg end
    if opts.sp then cmd = cmd .. ' guisp=' .. opts.sp end

    local attr = {}
    if opts.bold then table.insert(attr, 'bold') end
    if opts.italic then table.insert(attr, 'italic') end
    if opts.underline then table.insert(attr, 'underline') end
    if opts.undercurl then table.insert(attr, 'undercurl') end
    if opts.reverse then table.insert(attr, 'reverse') end
    if opts.strikethrough then table.insert(attr, 'strikethrough') end

    if #attr > 0 then
        cmd = cmd .. ' gui=' .. table.concat(attr, ',')
    end

    vim.cmd(cmd)
end

-- Function to apply multiple highlights
function M.apply_highlights(highlights)
    for group, opts in pairs(highlights) do
        M.highlight(group, opts)
    end
end

-- Function to link highlight groups
function M.link(from, to)
    vim.cmd('highlight! link ' .. from .. ' ' .. to)
end

-- Function to clear highlight group
function M.clear(group)
    vim.cmd('highlight clear ' .. group)
end

-- Function to check if a highlight group exists
function M.exists(group)
    local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
    return ok and next(hl) ~= nil
end

-- Function to get current highlight
function M.get_highlight(group)
    local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
    if ok then
        local result = {}
        if hl.foreground then result.fg = string.format('#%06x', hl.foreground) end
        if hl.background then result.bg = string.format('#%06x', hl.background) end
        if hl.special then result.sp = string.format('#%06x', hl.special) end
        if hl.bold then result.bold = true end
        if hl.italic then result.italic = true end
        if hl.underline then result.underline = true end
        if hl.undercurl then result.undercurl = true end
        if hl.reverse then result.reverse = true end
        if hl.strikethrough then result.strikethrough = true end
        return result
    end
    return {}
end

-- Function to convert hex to rgb
function M.hex_to_rgb(hex)
    hex = hex:gsub('#', '')
    return {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16)
    }
end

-- Function to convert rgb to hex
function M.rgb_to_hex(r, g, b)
    return string.format('#%02x%02x%02x', r, g, b)
end

-- Function to lighten a color
function M.lighten(color, amount)
    local rgb = M.hex_to_rgb(color)
    amount = amount or 0.1

    rgb.r = math.min(255, rgb.r + (255 - rgb.r) * amount)
    rgb.g = math.min(255, rgb.g + (255 - rgb.g) * amount)
    rgb.b = math.min(255, rgb.b + (255 - rgb.b) * amount)

    return M.rgb_to_hex(math.floor(rgb.r), math.floor(rgb.g), math.floor(rgb.b))
end

-- Function to darken a color
function M.darken(color, amount)
    local rgb = M.hex_to_rgb(color)
    amount = amount or 0.1

    rgb.r = math.max(0, rgb.r * (1 - amount))
    rgb.g = math.max(0, rgb.g * (1 - amount))
    rgb.b = math.max(0, rgb.b * (1 - amount))

    return M.rgb_to_hex(math.floor(rgb.r), math.floor(rgb.g), math.floor(rgb.b))
end

-- Function to blend two colors
function M.blend(color1, color2, ratio)
    ratio = ratio or 0.5
    local rgb1 = M.hex_to_rgb(color1)
    local rgb2 = M.hex_to_rgb(color2)

    local r = rgb1.r * (1 - ratio) + rgb2.r * ratio
    local g = rgb1.g * (1 - ratio) + rgb2.g * ratio
    local b = rgb1.b * (1 - ratio) + rgb2.b * ratio

    return M.rgb_to_hex(math.floor(r), math.floor(g), math.floor(b))
end

-- Function to calculate luminance
function M.luminance(color)
    local rgb = M.hex_to_rgb(color)

    -- Convert to linear RGB
    local function to_linear(c)
        c = c / 255
        if c <= 0.03928 then
            return c / 12.92
        else
            return math.pow((c + 0.055) / 1.055, 2.4)
        end
    end

    local r = to_linear(rgb.r)
    local g = to_linear(rgb.g)
    local b = to_linear(rgb.b)

    return 0.2126 * r + 0.7152 * g + 0.0722 * b
end

-- Function to calculate contrast ratio
function M.contrast_ratio(color1, color2)
    local lum1 = M.luminance(color1)
    local lum2 = M.luminance(color2)

    local lighter = math.max(lum1, lum2)
    local darker = math.min(lum1, lum2)

    return (lighter + 0.05) / (darker + 0.05)
end

-- Function to check if contrast is sufficient
function M.is_contrast_sufficient(fg, bg, level)
    level = level or 'AA' -- 'AA' requires 4.5:1, 'AAA' requires 7:1
    local ratio = M.contrast_ratio(fg, bg)

    if level == 'AAA' then
        return ratio >= 7
    else
        return ratio >= 4.5
    end
end

-- Function to automatically adjust color for better contrast
function M.auto_contrast(fg, bg, target_ratio)
    target_ratio = target_ratio or 4.5
    local current_ratio = M.contrast_ratio(fg, bg)

    if current_ratio >= target_ratio then
        return fg -- Already sufficient contrast
    end

    local bg_lum = M.luminance(bg)
    local step = 0.1
    local adjusted = fg

    -- Try lightening first
    for i = 1, 10 do
        adjusted = M.lighten(fg, step * i)
        if M.contrast_ratio(adjusted, bg) >= target_ratio then
            return adjusted
        end
    end

    -- Try darkening
    for i = 1, 10 do
        adjusted = M.darken(fg, step * i)
        if M.contrast_ratio(adjusted, bg) >= target_ratio then
            return adjusted
        end
    end

    return fg -- Return original if can't improve
end

-- Function to create gradient between colors
function M.gradient(color1, color2, steps)
    steps = steps or 5
    local colors = {}

    for i = 0, steps do
        local ratio = i / steps
        colors[i + 1] = M.blend(color1, color2, ratio)
    end

    return colors
end

-- Function to generate complement color
function M.complement(color)
    local rgb = M.hex_to_rgb(color)
    return M.rgb_to_hex(255 - rgb.r, 255 - rgb.g, 255 - rgb.b)
end

-- Function to validate hex color
function M.is_valid_hex(color)
    return color:match('^#[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]$') ~= nil
end

-- Function to format color for vim
function M.format_color(color)
    if color == 'NONE' or color == nil then
        return 'NONE'
    end

    if M.is_valid_hex(color) then
        return color
    end

    return 'NONE'
end

-- Function to create terminal colors array
function M.create_terminal_colors(palette)
    return {
        palette.bg,            -- black
        palette.red,           -- red
        palette.green,         -- green
        palette.yellow,        -- yellow
        palette.blue,          -- blue
        palette.purple,        -- magenta
        palette.cyan,          -- cyan
        palette.gray_light,    -- white
        palette.gray,          -- bright black
        palette.red_bright,    -- bright red
        palette.green_bright,  -- bright green
        palette.yellow_bright, -- bright yellow
        palette.blue_bright,   -- bright blue
        palette.purple_bright, -- bright magenta
        palette.cyan_bright,   -- bright cyan
        palette.fg,            -- bright white
    }
end

-- Function to set terminal colors
function M.set_terminal_colors(colors)
    for i, color in ipairs(colors) do
        vim.g['terminal_color_' .. (i - 1)] = color
    end
end

return M
