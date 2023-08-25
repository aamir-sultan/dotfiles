#!/bin/bash

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

# Function to escape a string for regular expression
escape_for_regex() {
    echo "$1" | sed -e 's/[][\\/.^$*]/\\&/g'
}

file_to_check=`echo "$DOTFILES/git/.git_aliases"`
file_to_modify=`echo "$HOME/.gitconfig"`
echo $file_to_modify
while IFS= read -r line; do
# Skip empty lines
    if [ -z "$line" ]; then
        continue
    fi
  # echo "---> $line"
  # grep -Fxq "$line" "$file_to_modify"
  escaped_line=$(escape_for_regex "$line")
  # echo "---> $line"
  # grep -Fxq "$escaped_line" "$file_to_modify"
  # echo $res
  # if [ $? -eq 0 ]; then
    sed -i "/$escaped_line/d" "$file_to_modify"
    # echo "Removed line: $line"
  # else
    # echo "Line not found: $line"
  # fi
done < "$file_to_check"
