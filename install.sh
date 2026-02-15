#!/usr/bin/env bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPLETION_FILE="$SCRIPT_DIR/_claude"

echo -e "${BLUE}Claude Code ZSH Completion Installer${NC}\n"

# Check if completion file exists
if [ ! -f "$COMPLETION_FILE" ]; then
  echo -e "${RED}Error: Completion file not found at $COMPLETION_FILE${NC}"
  exit 1
fi

# Function to install for Oh My Zsh
install_oh_my_zsh() {
  local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  local PLUGIN_DIR="$ZSH_CUSTOM/plugins/claude-code-zsh"

  echo -e "${BLUE}Installing for Oh My Zsh...${NC}"

  if [ ! -d "$ZSH_CUSTOM" ]; then
    echo -e "${RED}Error: Oh My Zsh custom directory not found${NC}"
    echo -e "Make sure Oh My Zsh is installed first"
    return 1
  fi

  # Create plugin directory
  mkdir -p "$PLUGIN_DIR"

  # Create symlinks to completion and plugin files
  ln -sf "$COMPLETION_FILE" "$PLUGIN_DIR/_claude"
  ln -sf "$SCRIPT_DIR/claude-code-zsh.plugin.zsh" "$PLUGIN_DIR/claude-code-zsh.plugin.zsh"

  echo -e "${GREEN}✓ Installed completion file${NC}"
  echo -e "\nAdd ${YELLOW}claude-code-zsh${NC} to your plugins in ~/.zshrc:"
  echo -e "  plugins=(... ${YELLOW}claude-code-zsh${NC})"
  echo -e "\nThen run: ${YELLOW}source ~/.zshrc${NC}"
}

# Function to install manually
install_manual() {
  local COMP_DIR="${ZDOTDIR:-$HOME}/.zsh/completions"

  echo -e "${BLUE}Installing manually...${NC}"

  # Create completions directory
  mkdir -p "$COMP_DIR"

  # Create symlink
  ln -sf "$COMPLETION_FILE" "$COMP_DIR/_claude"

  echo -e "${GREEN}✓ Installed completion file to $COMP_DIR${NC}"
  echo -e "\nAdd the following to your ~/.zshrc:"
  echo -e "  ${YELLOW}fpath=($COMP_DIR \$fpath)${NC}"
  echo -e "  ${YELLOW}autoload -Uz compinit && compinit${NC}"
  echo -e "\nThen run: ${YELLOW}source ~/.zshrc${NC}"
}

# Function to show Antigen instructions
show_antigen() {
  echo -e "${BLUE}Antigen Installation${NC}"
  echo -e "\nAdd the following to your ~/.zshrc:"
  echo -e "  ${YELLOW}antigen bundle $SCRIPT_DIR${NC}"
  echo -e "\nThen run: ${YELLOW}source ~/.zshrc${NC}"
}

# Function to show Zinit instructions
show_zinit() {
  echo -e "${BLUE}Zinit Installation${NC}"
  echo -e "\nAdd the following to your ~/.zshrc:"
  echo -e "  ${YELLOW}zinit load $SCRIPT_DIR${NC}"
  echo -e "\nOr for lazy loading:"
  echo -e "  ${YELLOW}zinit wait lucid for $SCRIPT_DIR${NC}"
  echo -e "\nThen run: ${YELLOW}source ~/.zshrc${NC}"
}

# Function to show direct source instructions
show_direct() {
  echo -e "${BLUE}Direct Sourcing${NC}"
  echo -e "\nAdd the following to your ~/.zshrc:"
  echo -e "  ${YELLOW}fpath=($SCRIPT_DIR \$fpath)${NC}"
  echo -e "  ${YELLOW}autoload -Uz compinit && compinit${NC}"
  echo -e "\nThen run: ${YELLOW}source ~/.zshrc${NC}"
}

# Main installation menu
echo "Choose installation method:"
echo "  1) Oh My Zsh plugin"
echo "  2) Manual (fpath)"
echo "  3) Antigen (show instructions)"
echo "  4) Zinit (show instructions)"
echo "  5) Direct source (show instructions)"
echo ""
read -p "Enter choice [1-5]: " choice

case $choice in
  1)
    install_oh_my_zsh
    ;;
  2)
    install_manual
    ;;
  3)
    show_antigen
    ;;
  4)
    show_zinit
    ;;
  5)
    show_direct
    ;;
  *)
    echo -e "${RED}Invalid choice${NC}"
    exit 1
    ;;
esac

echo -e "\n${GREEN}Installation complete!${NC}"
echo -e "\n${YELLOW}Note:${NC} After installation, you may need to run:"
echo -e "  ${YELLOW}rm -f ~/.zcompdump* && exec zsh${NC}"
echo -e "to clear the completion cache and reload your shell."
