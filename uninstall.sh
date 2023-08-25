#!/bin/bash

# Function to escape a string for regular expression
escape_for_regex() {
    echo "$1" | sed -e 's/[][\\/.^$*]/\\&/g'
}

# Check if the DOTFILES is not set
if [ -z "$DOTFILES" ]; then
# Set the DOTFILES path to this script.
    DOTFILES="$(cd "$(dirname "$0")" && pwd)"
fi

rm -rf ~/.config/nvim
rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
# rm -rf ~/.gitconfig
rm -rf ~/.dircolors

PATTERN=`echo "source $DOTFILES/vim/.vimrc"`
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" ~/.vimrc

PATTERN=`echo "source $DOTFILES/bash/.bashrc"`
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" ~/.bashrc

PATTERN=`echo "source-file $DOTFILES/tmux/.tmux.conf"`
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" ~/.tmux.conf

PATTERN=`echo -e "[include]\n"`
ESC_PATTERN=$(escape_for_regex "$PATTERN")
sed -i "/$ESC_PATTERN/d" ~/.gitconfig
PATTERN=`echo -e "  path = $DOTFILES/git/.git_aliases\n"`
ESC_PATTERN=$(escape_for_regex "$PATTERN")
sed -i "/$ESC_PATTERN/d" ~/.gitconfig


file_to_check=`echo "$DOTFILES/git/.git_aliases"`
file_to_modify=`echo "$HOME/.gitconfig"`

while IFS= read -r line; do
# Skip empty lines
    if [ -z "$line" ]; then
        continue
    fi
  escaped_line=$(escape_for_regex "$line")
    sed -i "/$escaped_line/d" "$file_to_modify"
done < "$file_to_check"
