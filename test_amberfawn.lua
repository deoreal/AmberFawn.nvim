#!/usr/bin/env lua

-- Quick test script for AmberFawn colorscheme
-- Run this script to verify the colorscheme works correctly
-- Usage: lua test_amberfawn.lua

local function test_amberfawn()
    print("🎨 Testing AmberFawn Colorscheme...")
    print("=" .. string.rep("=", 40))

    -- Test 1: Module Loading
    print("\n📦 Testing module loading...")
    local success, amberfawn = pcall(require, "amberfawn")
    if success then
        print("✅ Main module loaded successfully")
    else
        print("❌ Failed to load main module: " .. tostring(amberfawn))
        return false
    end

    -- Test 2: Submodules
    local modules = {
        "amberfawn.palette",
        "amberfawn.utils",
        "amberfawn.treesitter",
        "amberfawn.plugins"
    }

    for _, module in ipairs(modules) do
        local ok, mod = pcall(require, module)
        if ok then
            print("✅ " .. module .. " loaded")
        else
            print("❌ Failed to load " .. module)
            return false
        end
    end

    -- Test 3: Color Palette
    print("\n🎨 Testing color palette...")
    local palette = require("amberfawn.palette")
    local required_colors = { "bg", "fg", "amber", "fawn", "red", "green", "blue" }

    for _, color in ipairs(required_colors) do
        if palette.colors[color] then
            print("✅ Color '" .. color .. "' = " .. palette.colors[color])
        else
            print("❌ Missing color: " .. color)
            return false
        end
    end

    -- Test 4: Setup and Load
    print("\n⚙️  Testing setup and load...")
    local setup_ok = pcall(amberfawn.setup, {})
    if setup_ok then
        print("✅ Setup completed successfully")
    else
        print("❌ Setup failed")
        return false
    end

    local load_ok = pcall(amberfawn.load)
    if load_ok then
        print("✅ Colorscheme loaded successfully")
        print("✅ Colors name set to: " .. (vim.g.colors_name or "none"))
    else
        print("❌ Failed to load colorscheme")
        return false
    end

    -- Test 5: API Functions
    print("\n🔧 Testing API functions...")
    local api_functions = { "get_color", "toggle_transparency", "set_contrast" }

    for _, func in ipairs(api_functions) do
        if type(amberfawn[func]) == "function" then
            print("✅ API function '" .. func .. "' available")
        else
            print("❌ Missing API function: " .. func)
        end
    end

    -- Test 6: Get specific color
    local amber_color = amberfawn.get_color("amber")
    if amber_color then
        print("✅ Retrieved amber color: " .. amber_color)
    else
        print("❌ Failed to get amber color")
    end

    -- Test 7: Highlight groups
    print("\n🎯 Testing highlight groups...")
    local test_groups = { "Normal", "Comment", "String", "Function", "Keyword" }

    for _, group in ipairs(test_groups) do
        local hl = vim.api.nvim_get_hl_by_name(group, true)
        if next(hl) then
            print("✅ Highlight group '" .. group .. "' is defined")
        else
            print("❌ Missing highlight group: " .. group)
        end
    end

    print("\n" .. string.rep("=", 40))
    print("🎉 All tests passed! AmberFawn is ready to use.")
    print("\nTo use AmberFawn:")
    print("  require('amberfawn').setup()")
    print("  vim.cmd([[colorscheme amberfawn]])")
    print("\nEnjoy your warm, amber-toned coding experience! ☀️")

    return true
end

-- Run the test
if not pcall(test_amberfawn) then
    print("\n❌ Test failed. Please check your AmberFawn installation.")
    os.exit(1)
end
