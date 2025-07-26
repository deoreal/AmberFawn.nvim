# AmberFawn.nvim

A warm, earthy colorscheme for Neovim optimized for treesitter syntax highlighting.

![AmberFawn Preview]((https://github.com/deoreal/AmberFawn.nvim/blob/1aa4f623d6f6ed7388b104fe1cbf3e0034a116ab/AmberFawn-screenshot.jpg))

## ✨ Features

- 🎨 **Warm Color Palette**: Amber and fawn tones create a cozy coding environment
- 🌳 **Treesitter Optimized**: Extensive treesitter highlights for modern syntax highlighting
- 🔌 **Plugin Support**: Built-in support for 25+ popular Neovim plugins
- ⚙️ **Highly Configurable**: Customizable colors, styles, and transparency
- 🎯 **Accessibility**: Proper contrast ratios and color-blind friendly
- 📱 **Terminal Support**: Includes terminal color definitions
- 🚀 **Performance**: Modular design for fast loading

## 🎨 Color Palette

### Primary Colors
- **Amber** (`#ffbf47`) - Keywords, primary accents
- **Fawn** (`#d4a574`) - Properties, secondary accents
- **Background** (`#1a1611`) - Deep warm brown
- **Foreground** (`#e8dcc6`) - Warm off-white

### Syntax Colors
- **Strings** (`#98c379`) - Green
- **Numbers** (`#d19a66`) - Orange
- **Functions** (`#61afef`) - Blue
- **Types** (`#56b6c2`) - Cyan
- **Comments** (`#5c6370`) - Gray
- **Keywords** (`#ffbf47`) - Amber
- **Errors** (`#e06c75`) - Red

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "your-username/AmberFawn.nvim",
  priority = 1000,
  config = function()
    require("amberfawn").setup({
      -- your configuration here
    })
    vim.cmd([[colorscheme amberfawn]])
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "your-username/AmberFawn.nvim",
  config = function()
    require("amberfawn").setup()
    vim.cmd([[colorscheme amberfawn]])
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'your-username/AmberFawn.nvim'

" In your init.vim or init.lua
lua require("amberfawn").setup()
colorscheme amberfawn
```

## ⚙️ Configuration

### Default Configuration

```lua
require("amberfawn").setup({
  -- Style options
  style = "dark", -- 'dark' or 'light' (light not implemented yet)
  
  -- Transparency options
  transparent = false,
  terminal_colors = true,
  
  -- Style preferences
  italic_comments = true,
  italic_keywords = false,
  italic_functions = false,
  italic_variables = false,
  
  -- Contrast and accessibility
  contrast = "medium", -- 'low', 'medium', 'high'
  dim_inactive = false,
  
  -- Plugin integrations (all enabled by default)
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
  colors = {},
  
  -- Custom highlight overrides
  overrides = {},
})
```

### Example Configurations

#### Transparent Background

```lua
require("amberfawn").setup({
  transparent = true,
})
```

#### High Contrast

```lua
require("amberfawn").setup({
  contrast = "high",
  italic_comments = true,
  italic_keywords = true,
})
```

#### Custom Colors

```lua
require("amberfawn").setup({
  colors = {
    amber = "#ffcc55",
    fawn = "#cc9966",
  },
})
```

#### Custom Overrides

```lua
require("amberfawn").setup({
  overrides = {
    Normal = { bg = "#000000" },
    Comment = { fg = "#888888", italic = true },
  },
})
```

#### Function-based Overrides

```lua
require("amberfawn").setup({
  overrides = function(colors, highlight, config)
    return {
      Normal = { bg = colors.bg, fg = colors.fg },
      ["@string"] = { fg = colors.green, italic = true },
    }
  end,
})
```

## 🔌 Plugin Support

AmberFawn includes built-in support for the following plugins:

### File Explorers
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

### Fuzzy Finders
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

### UI Enhancements
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [noice.nvim](https://github.com/folke/noice.nvim)

### Git Integration
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

### LSP and Completion
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)
- [fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)

### Navigation
- [flash.nvim](https://github.com/folke/flash.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [hop.nvim](https://github.com/phaazon/hop.nvim)

### Testing and Debugging
- [neotest](https://github.com/nvim-neotest/neotest)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)

### Package Management
- [lazy.nvim](https://github.com/folke/lazy.nvim)

### Mini.nvim Suite
- Complete support for [mini.nvim](https://github.com/echasnovski/mini.nvim) modules

### Other
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [copilot.vim](https://github.com/github/copilot.vim)
- [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
- [overseer.nvim](https://github.com/stevearc/overseer.nvim)

## 🎯 Treesitter Support

AmberFawn provides extensive treesitter highlighting for:

- **Languages**: Lua, Python, JavaScript, TypeScript, Rust, Go, C/C++, HTML, CSS, JSON, YAML, SQL, Bash, and more
- **Syntax Elements**: Functions, variables, types, keywords, strings, comments, operators
- **Semantic Highlighting**: LSP-based semantic tokens
- **Language-specific**: Custom highlights for language-specific constructs

## 🚀 API

### Functions

```lua
local amberfawn = require("amberfawn")

-- Load the colorscheme
amberfawn.load()

-- Get a specific color
local amber = amberfawn.get_color("amber")

-- Toggle transparency
amberfawn.toggle_transparency()

-- Set contrast level
amberfawn.set_contrast("high") -- "low", "medium", "high"

-- Toggle italic comments
amberfawn.toggle_italic_comments()

-- Access color palette
local colors = amberfawn.colors
local palette = amberfawn.palette
local utils = amberfawn.utils
```

### Color Utilities

```lua
local utils = require("amberfawn.utils")

-- Color manipulation
local lighter = utils.lighten("#ffbf47", 0.2)
local darker = utils.darken("#ffbf47", 0.2)
local blended = utils.blend("#ffbf47", "#d4a574", 0.5)

-- Contrast checking
local ratio = utils.contrast_ratio("#ffbf47", "#1a1611")
local is_accessible = utils.is_contrast_sufficient("#ffbf47", "#1a1611", "AA")

-- Highlight utilities
utils.highlight("MyGroup", { fg = "#ffbf47", bold = true })
utils.apply_highlights({
  MyGroup1 = { fg = "#ffbf47" },
  MyGroup2 = { fg = "#d4a574" },
})
```

## 🎨 Screenshots

### Code Examples

#### Lua
```lua
local M = {}

-- Configuration for AmberFawn
M.config = {
  style = "dark",
  transparent = false,
  italic_comments = true,
}

function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", M.config, opts)
end

return M
```

#### Python
```python
from typing import List, Optional
import asyncio

class AmberFawnConfig:
    """Configuration class for AmberFawn colorscheme."""
    
    def __init__(self, style: str = "dark", transparent: bool = False):
        self.style = style
        self.transparent = transparent
    
    async def apply_settings(self) -> None:
        """Apply the configuration settings."""
        if self.transparent:
            print("Applying transparent background")
        
        # TODO: Implement color application
        pass

# Example usage
config = AmberFawnConfig("dark", True)
asyncio.run(config.apply_settings())
```

#### JavaScript/TypeScript
```typescript
interface AmberFawnConfig {
  style: 'dark' | 'light';
  transparent: boolean;
  plugins: string[];
}

class ColorScheme {
  private config: AmberFawnConfig;
  
  constructor(config: AmberFawnConfig) {
    this.config = config;
  }
  
  public async loadColors(): Promise<void> {
    try {
      const colors = await this.fetchColors();
      this.applyColors(colors);
    } catch (error) {
      console.error('Failed to load colors:', error);
    }
  }
  
  private applyColors(colors: Record<string, string>): void {
    // Implementation here
  }
}
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Clone your fork
3. Create a feature branch
4. Make your changes
5. Test with various file types and plugins
6. Submit a pull request

### Adding Plugin Support

To add support for a new plugin:

1. Add highlight definitions to `lua/amberfawn/plugins.lua`
2. Test the highlights with the plugin
3. Add the plugin to the README
4. Submit a PR

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by warm, natural color palettes
- Built for the modern Neovim ecosystem
- Thanks to the Neovim community for amazing plugins

## 📸 Gallery

### Dashboard
*Clean and welcoming startup screen*

### File Explorer
*Intuitive file navigation with proper color coding*

### Code Editing
*Syntax highlighting that makes code readable and beautiful*

### Terminal
*Consistent colors in integrated terminal*

---

Made with ❤️ for the Neovim community
