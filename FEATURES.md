# AmberFawn.nvim - Complete Feature Overview

AmberFawn is a warm-toned colorscheme for Neovim that prioritizes readability and modern treesitter integration

## 📊 Technical Specifications

### Architecture
```
Modular Design:
├── colors/amberfawn.lua      # Entry point colorscheme file
├── lua/amberfawn/
│   ├── init.lua              # Core API and configuration
│   ├── palette.lua           # Color definitions and variants
│   ├── utils.lua             # Color manipulation utilities
│   ├── treesitter.lua        # Treesitter-specific highlights
│   └── plugins.lua           # Plugin-specific highlights
```

### Treesitter Highlight Categories

#### Core Language Elements
- **Keywords**: `for`, `if`, `function`, `class`, etc. (Amber - bold)
- **Strings**: All string types including templates (Green)
- **Numbers**: Integers, floats, hex, binary (Orange)
- **Comments**: Single and multi-line with documentation (Gray - italic)
- **Operators**: Mathematical and logical operators (Fawn)

#### Advanced Constructs
- **Functions**: User-defined and built-in functions (Blue variants)
- **Types**: Classes, interfaces, structs (Cyan)
- **Variables**: Local, global, parameters (Foreground with variants)
- **Constants**: Immutable values and enums (Orange - bold)
- **Properties**: Object properties and fields (Fawn variants)

#### Contextual Highlighting
- **Built-in vs User-defined**: Different intensities for built-in functions
- **Mutable vs Immutable**: Visual distinction for constant values
- **Scope Indicators**: Different shades for local vs global scope
- **Documentation**: Special treatment for doc comments and strings

## 🔌 Plugin Integration Details

### File Management
- **nvim-tree**: Folder icons, git status, file type icons
- **neo-tree**: Enhanced sidebar, git integration, file operations
- **oil.nvim**: File editing interface (basic support)

### Navigation & Search
- **telescope.nvim**: Borders, prompts, results highlighting
- **fzf-lua**: Alternative fuzzy finder support
- **nvim-navic**: Breadcrumb navigation in winbar

### UI Enhancement
- **lualine.nvim**: Status line with mode-specific colors
- **bufferline.nvim**: Tab-like buffer management
- **which-key.nvim**: Key binding help popup
- **indent-blankline.nvim**: Indentation guides and context
- **nvim-notify**: Toast notifications with severity colors

### Git Integration
- **gitsigns.nvim**: Git status in sign column and inline
- **diffview.nvim**: Enhanced diff viewing (basic support)
- **neogit**: Git interface (basic support)

### LSP & Completion
- **nvim-cmp**: Completion menu with kind icons
- **mason.nvim**: LSP server management interface
- **trouble.nvim**: Diagnostics and references panel
- **aerial.nvim**: Symbol outline and navigation
- **fidget.nvim**: LSP progress notifications

### Development Tools
- **neotest**: Test result visualization
- **nvim-dap**: Debug adapter interface
- **overseer.nvim**: Task runner interface
- **toggleterm.nvim**: Terminal integration

### Motion & Navigation
- **flash.nvim**: Enhanced search and jump
- **leap.nvim**: Alternative motion plugin
- **hop.nvim**: EasyMotion-style navigation

### Mini.nvim Suite
Complete support for all mini.nvim modules including:
- mini.files, mini.pick, mini.statusline, mini.tabline
- mini.diff, mini.git, mini.notify
- mini.animate, mini.cursorword, mini.hipatterns
- And many more...


*Built with ❤️ for the Neovim community*
