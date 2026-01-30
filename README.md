# 🚀 Dotfiles

My personal development environment configuration files for macOS.

## 📦 What's Included

- **Neovim** - AstroNvim configuration with custom plugins
  - yazi.nvim (file manager integration)
  - markdown-preview.nvim
- **Fish Shell** - Modern shell with custom functions
  - yazi cd-on-quit integration
- **Zellij** - Terminal multiplexer configuration
- **Ghostty** - Terminal emulator configuration
- **Yazi** - Terminal file manager

## ⚡ Quick Start

### New Machine Setup

```bash
# Clone this repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Run the install script
cd ~/dotfiles
./install.sh
```

That's it! The script will:
- Install Homebrew (if not installed)
- Install essential packages (neovim, fish, yazi, zellij, fzf, etc.)
- Create symlinks to configuration files
- Set Fish as your default shell
- Install Fisher (Fish plugin manager)

### After Installation

1. **Restart your terminal** to activate Fish shell
2. **Launch Neovim** for the first time:
   ```bash
   nvim
   ```
   AstroNvim will automatically install all plugins (this takes a few minutes)

3. **Enjoy your new environment!**

## 🛠️ Manual Installation

If you prefer to install components individually:

### Neovim
```bash
ln -sf ~/dotfiles/nvim ~/.config/nvim
```

### Fish
```bash
ln -sf ~/dotfiles/fish ~/.config/fish
```

### Zellij
```bash
ln -sf ~/dotfiles/zellij ~/.config/zellij
```

### Ghostty
```bash
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

## 📝 Key Features

### Neovim

**Custom Plugins:**
- `yazi.nvim` - File manager integration
  - `Space + -` - Open yazi at current file
  - `Space + cw` - Open yazi at working directory
- `markdown-preview.nvim` - Live markdown preview
  - `Space + m + p` - Toggle preview

**AstroNvim Keybindings:**
- `Space + e` - Toggle file explorer (Neo-tree)
- `Space + ff` - Find files (Telescope)
- `Space + fw` - Find words (grep)
- `Space + c` - Close buffer
- `Ctrl + h/j/k/l` - Navigate between windows

### Fish Shell

**Custom Functions:**
- `yy` - Open yazi and cd to selected directory on quit

### Zellij (Terminal Multiplexer)

- `Ctrl + p` - Pane mode
- `Ctrl + t` - Tab mode
- `Ctrl + n` - Resize mode
- `Ctrl + s` - Scroll mode
- `Ctrl + o` - Session mode

### Terminal (Ghostty)

- `Cmd + T` - New tab
- `Cmd + W` - Close tab
- `Cmd + Shift + [/]` - Switch tabs

## 📂 Structure

```
dotfiles/
├── nvim/              # Neovim configuration (AstroNvim)
│   ├── init.lua
│   └── lua/
│       └── plugins/   # Custom plugins
│           ├── yazi.lua
│           └── markdown-preview.lua
├── fish/              # Fish shell configuration
│   └── config.fish
├── zellij/            # Zellij terminal multiplexer configuration
│   └── config.kdl
├── ghostty/           # Ghostty terminal configuration
│   └── config
├── install.sh         # Automated setup script
└── README.md          # This file
```

## 🔄 Keeping Your Dotfiles in Sync

### Updating Your Local Dotfiles

When you make changes to your configuration:

```bash
cd ~/dotfiles
git add .
git commit -m "Update configuration"
git push
```

### Pulling Updates on Another Machine

```bash
cd ~/dotfiles
git pull
```

Configuration files are symlinked, so changes are applied immediately!

## 🎨 Customization

Feel free to customize these dotfiles to your liking:

- **Neovim plugins**: Edit files in `nvim/lua/plugins/`
- **Fish functions**: Add functions to `fish/config.fish`
- **Zellij settings**: Edit `zellij/config.kdl`
- **Ghostty settings**: Edit `ghostty/config`

## 📚 Documentation

Additional documentation in `~/docs/dev-notes/`:
- [Neovim + Yazi Setup Guide](~/docs/dev-notes/neovim-yazi-setup.md)
- [Neovim Movement Guide](~/docs/dev-notes/nvim-movement-guide.md)

## 🐛 Troubleshooting

### Neovim plugins not installing
```bash
# Inside Neovim
:Lazy sync
```

### Fish not set as default shell
```bash
chsh -s $(which fish)
```

### Symlinks not working
```bash
# Re-run the install script
cd ~/dotfiles
./install.sh
```

## 📖 Resources

- [AstroNvim Documentation](https://docs.astronvim.com/)
- [Fish Shell Documentation](https://fishshell.com/docs/current/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Zellij Documentation](https://zellij.dev/documentation/)
- [Yazi Documentation](https://yazi-rs.github.io/)

## 🔒 License & Privacy

### Licenses

All tools included in this configuration are open-source and **safe for commercial use**:

| Tool | License | Commercial Use | Notes |
|------|---------|---------------|-------|
| **Neovim** | Apache 2.0 / Vim License | ✅ Yes | Both licenses permit commercial use |
| **Fish Shell** | GPL v2 | ✅ Yes | Free to use commercially |
| **Ghostty** | MIT | ✅ Yes | Very permissive license |
| **AstroNvim** | GPL v3 | ✅ Yes | Free to use commercially |
| **Zellij** | MIT | ✅ Yes | Very permissive license |
| **Yazi** | MIT | ✅ Yes | Very permissive license |

**For Business/Enterprise Use:**
All of these tools can be freely used in commercial environments, including:
- Installing on company computers
- Using for work-related development
- Sharing configurations within teams

The GPL licenses (Fish, AstroNvim) only have requirements if you **distribute modified versions** publicly. Simply using them at work is completely fine.

### Privacy & Telemetry

**Zero telemetry. Zero data collection. Complete privacy. 🔒**

| Tool | Telemetry | Privacy Status |
|------|-----------|----------------|
| **Neovim** | ❌ None | Fully offline, no network communication |
| **Fish Shell** | ❌ None | Fully offline |
| **Ghostty** | ❌ None | Privacy-first design, completely offline |
| **AstroNvim** | ❌ None | Only connects to download plugins |
| **Zellij** | ❌ None | Fully offline |
| **Yazi** | ❌ None | Fully offline |

**Network Communication:**
- **Plugin installation only**: Neovim and Fish download plugins from GitHub during initial setup
- **No usage tracking**: None of these tools send any telemetry, analytics, or usage data
- **No cloud features**: No account creation, no external servers, no command history syncing
- **No data collection**: Your code, commands, and workflow stay completely private on your machine

**Why It's Safe:**
- ✅ All tools are open-source (code is publicly auditable)
- ✅ Work completely offline after initial setup
- ✅ No account or registration required
- ✅ Used by thousands of developers who would immediately report suspicious behavior
- ✅ Safe for handling confidential/proprietary code

Unlike cloud-connected terminals (Warp, Fig, etc.), these tools operate entirely on your local machine with no external dependencies.

## 📄 License

Feel free to use and modify these dotfiles for your own use!

---

**Happy coding! 🎉**
