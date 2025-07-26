# Changelog

All notable changes to AmberFawn.nvim will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of AmberFawn colorscheme
- Warm, earthy color palette with amber and fawn tones
- Comprehensive treesitter syntax highlighting
- Support for 25+ popular Neovim plugins
- Modular architecture for easy customization
- Extensive configuration options
- Color manipulation utilities
- Accessibility features with proper contrast ratios
- Terminal color integration
- LSP semantic token support
- Language-specific treesitter highlights

### Features
- **Core Colorscheme**
  - Dark theme with warm brown background (`#1a1611`)
  - Amber primary accent (`#ffbf47`) for keywords and highlights
  - Fawn secondary accent (`#d4a574`) for properties and UI elements
  - Carefully selected syntax colors for optimal readability
  - Support for transparency and contrast adjustments

- **Treesitter Integration**
  - Optimized highlighting for modern syntax parsing
  - Language-specific customizations for Lua, Python, JavaScript, TypeScript, Rust, Go, C/C++
  - Semantic highlighting support
  - Proper distinction between different code elements
  - Enhanced markdown and documentation support

- **Plugin Support**
  - **File Explorers**: nvim-tree, neo-tree
  - **Fuzzy Finders**: telescope.nvim
  - **UI Enhancement**: lualine, bufferline, which-key, indent-blankline, notify, noice
  - **Git Integration**: gitsigns
  - **LSP & Completion**: nvim-cmp, mason, trouble, aerial, fidget, navic
  - **Navigation**: flash, leap, hop
  - **Testing & Debugging**: neotest, nvim-dap
  - **Package Management**: lazy.nvim
  - **Mini.nvim**: Complete suite support
  - **Other**: dashboard, alpha, copilot, rainbow-delimiters, overseer

- **Configuration Options**
  - Style preferences (italic comments, keywords, functions, variables)
  - Transparency support
  - Contrast levels (low, medium, high)
  - Inactive window dimming
  - Per-plugin enable/disable
  - Custom color overrides
  - Custom highlight overrides
  - Function-based configuration for advanced users

- **Developer Experience**
  - Modular file structure for maintainability
  - Comprehensive API for external integrations
  - Color manipulation utilities
  - Contrast checking functions
  - Hot-reloading support
  - Example configurations
  - Extensive documentation

- **Accessibility**
  - WCAG-compliant contrast ratios
  - Color-blind friendly palette
  - High contrast mode available
  - Semantic color usage

### Technical Implementation
- **Architecture**: Modular design with separate modules for palette, utilities, treesitter, and plugins
- **Performance**: Optimized loading with conditional plugin support
- **Compatibility**: Neovim 0.8+ with treesitter support
- **Extensibility**: Easy to extend with new plugins and languages

### File Structure
```
AmberFawn.nvim/
├── colors/
│   └── amberfawn.lua          # Main colorscheme entry point
├── lua/amberfawn/
│   ├── init.lua               # Core module and API
│   ├── palette.lua            # Color definitions and variants
│   ├── utils.lua              # Utility functions for colors and highlights
│   ├── treesitter.lua         # Treesitter-specific highlights
│   └── plugins.lua            # Plugin-specific highlights
├── examples/
│   ├── config.lua             # Example configuration
│   └── demo.lua               # Syntax highlighting demo
├── README.md                  # Comprehensive documentation
├── CHANGELOG.md               # This file
└── LICENSE                    # MIT license
```

### Installation Methods
- **lazy.nvim**: Full plugin manager integration
- **packer.nvim**: Traditional Neovim package manager
- **vim-plug**: Vim-style plugin management
- **Manual**: Direct repository cloning

### Usage Examples
```lua
-- Basic setup
require("amberfawn").setup()
vim.cmd([[colorscheme amberfawn]])

-- Advanced configuration
require("amberfawn").setup({
  transparent = true,
  contrast = "high",
  italic_comments = true,
  colors = {
    amber = "#ffcc55",
  },
  overrides = function(colors, highlight, config)
    return {
      Normal = { fg = colors.fg, bg = colors.bg },
    }
  end,
})

-- API usage
local amberfawn = require("amberfawn")
amberfawn.toggle_transparency()
amberfawn.set_contrast("high")
local amber_color = amberfawn.get_color("amber")
```

### Dependencies
- Neovim >= 0.8.0
- treesitter (recommended for optimal syntax highlighting)
- Compatible plugins (optional, for enhanced integration)

### Known Issues
- Light theme not yet implemented (planned for future release)
- Some plugin integrations may need updates as plugins evolve

### Roadmap
- [ ] Light theme variant
- [ ] Additional language-specific customizations
- [ ] More plugin integrations
- [ ] Performance optimizations
- [ ] Color palette variants
- [ ] Integration with external color tools
- [ ] VS Code port consideration

### Contributing
Contributions welcome! Areas of focus:
- New plugin integrations
- Language-specific treesitter improvements
- Bug fixes and optimizations
- Documentation improvements
- Testing and quality assurance

### Credits
- Inspired by warm, natural color palettes
- Built for the modern Neovim ecosystem
- Thanks to the Neovim and plugin communities

---

**Note**: This is the initial release. Version numbers will follow semantic versioning starting with v1.0.0 upon official release.