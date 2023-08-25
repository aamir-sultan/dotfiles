#!/bin/bash

# Check if the DOTFILES is not set
if [ -z "$DOTFILES" ]; then
# Set the DOTFILES path to this script.
    DOTFILES="$(cd "$(dirname "$0")" && pwd)"
fi

rm -rf ~/.config/nvim
rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
rm -rf ~/.gitconfig
rm -rf ~/.dircolors

PATTERN=`echo "source $DOTFILES/vim/.vimrc"`
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" ~/.vimrc

PATTERN=`echo "source $DOTFILES/bash/.bashrc"`
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" ~/.bashrc
