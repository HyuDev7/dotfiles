#!/bin/bash

# Dotfiles install script
# This script sets up your development environment on a new machine

set -e  # Exit on error

echo "🚀 Starting dotfiles installation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}➜${NC} $1"
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2

    if [ -e "$target" ] || [ -L "$target" ]; then
        print_info "Backing up existing $target to $target.backup"
        mv "$target" "$target.backup"
    fi

    ln -sf "$source" "$target"
    print_success "Linked $source -> $target"
}

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_error "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

# Install essential packages
print_info "Installing essential packages..."

packages=(
    "neovim"
    "fish"
    "yazi"
    "fzf"
    "git"
    "node"
)

for package in "${packages[@]}"; do
    if brew list "$package" &> /dev/null; then
        print_success "$package already installed"
    else
        print_info "Installing $package..."
        brew install "$package"
        print_success "$package installed"
    fi
done

# Install Ghostty (if not installed)
if ! command -v ghostty &> /dev/null; then
    print_info "Ghostty not found. Please install it manually from https://ghostty.org"
else
    print_success "Ghostty already installed"
fi

# Create necessary directories
print_info "Creating config directories..."
mkdir -p ~/.config

# Setup Neovim
print_info "Setting up Neovim (AstroNvim)..."
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Setup Fish
print_info "Setting up Fish shell..."
create_symlink "$DOTFILES_DIR/fish" "$HOME/.config/fish"

# Setup Ghostty
print_info "Setting up Ghostty..."
mkdir -p ~/.config/ghostty
create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

# Set Fish as default shell
if [ "$SHELL" != "$(which fish)" ]; then
    print_info "Setting Fish as default shell..."
    if ! grep -q "$(which fish)" /etc/shells; then
        echo "$(which fish)" | sudo tee -a /etc/shells
    fi
    chsh -s "$(which fish)"
    print_success "Fish set as default shell (restart terminal to apply)"
else
    print_success "Fish is already the default shell"
fi

# Install Fisher (Fish plugin manager) if not installed
print_info "Checking for Fisher (Fish plugin manager)..."
if ! fish -c "type -q fisher" &> /dev/null; then
    print_info "Installing Fisher..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
    print_success "Fisher installed"
else
    print_success "Fisher already installed"
fi

echo ""
echo "=========================================="
print_success "Dotfiles installation complete!"
echo "=========================================="
echo ""
echo "📝 Next steps:"
echo "  1. Restart your terminal"
echo "  2. Run 'nvim' to let AstroNvim install plugins (first time only)"
echo "  3. Customize your setup as needed"
echo ""
echo "📚 Your dotfiles are located at: $DOTFILES_DIR"
echo ""
