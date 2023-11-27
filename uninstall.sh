#!/bin/bash

# Function to escape a string for regular expression
escape_for_regex() {
  echo "$1" | sed -e 's/[][\\/.^$*]/\\&/g'
}

# Function for the ini file entry like [core] [include] in case there is no line below them
remove_line_if_trailing_line_is_empty() {
  pattern="$1"
  file="$2"

  TMP_FILE=$(mktemp)

  match_pattern=$(grep -i "$pattern" "$file")
  match_trailing_line=$(grep -A1 "$pattern" "$file" | grep -v "$pattern" | grep -v -E '^$')

  if [ "$match_pattern" != "" ] && [ "$match_trailing_line" == "" ]; then # If pattern matched and next line is empty
    grep -v "$pattern" "$file" >$TMP_FILE
    # sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' $TMP_FILE # Remove the trailing empty lines in the file.
    sed -i -e '/^$/N;/^\n$/D' $TMP_FILE # Remove one empty line from two consecutive empty lines
    mv $TMP_FILE $file
  fi
}

reduce_empty_lines() {
  FILE=$1
  sed -i -e '/^$/N;/^\n$/D' $FILE # Remove one empty line from two consecutive empty lines
}

# Check if the DOTFILES is not set
if [ -z "$DOTFILES" ]; then
  # Set the DOTFILES path to this script.
  DOTFILES="$(cd "$(dirname "$0")" && pwd)"
fi
source $DOTFILES/system/.variables

rm -rf ~/.config/nvim
rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
# rm -rf ~/.gitconfig
rm -rf ~/.dircolors
rm -rf ~/.tmux

# Created by .vimrc for backup, undo and swap files.
rm -rf ~/.vim/backup
rm -rf ~/.vim/undo
rm -rf ~/.vim/swp

PATTERN=$(echo "source $DOTFILES/vim/.vimrc")
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" $VIMRC_PATH

PATTERN=$(echo "source $DOTFILES/bash/.bashrc")
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" $BASHRC_PATH

PATTERN=$(echo "source-file $DOTFILES/tmux/.tmux.conf")
ESC_PATTERN=$(printf '%s\n' "$PATTERN" | sed -e 's/[\/&]/\\&/g')
sed -i "/$ESC_PATTERN/d" $TMUXCONF_PATH

PATTERN=$(echo -e "  path = $DOTFILES/git/gitconfig\n")
ESC_PATTERN=$(escape_for_regex "$PATTERN")
sed -i "/$ESC_PATTERN/d" $GITCONFIG_PATH
PATTERN=$(echo -e "  excludesfile = $DOTFILES/git/gitignore_global\n")
ESC_PATTERN=$(escape_for_regex "$PATTERN")
sed -i "/$ESC_PATTERN/d" $GITCONFIG_PATH

PATTERN=$(echo -e "[include]\n")
ESC_PATTERN=$(escape_for_regex "$PATTERN")
remove_line_if_trailing_line_is_empty $ESC_PATTERN $GITCONFIG_PATH

PATTERN=$(echo -e "[core]\n")
ESC_PATTERN=$(escape_for_regex "$PATTERN")
remove_line_if_trailing_line_is_empty $ESC_PATTERN $GITCONFIG_PATH

file_to_check=$(echo "$DOTFILES/git/gitaliases")
file_to_modify=$(echo "$HOME/.gitconfig")

while IFS= read -r line; do
  # Skip empty lines
  if [ -z "$line" ]; then
    continue
  fi
  escaped_line=$(escape_for_regex "$line")
  sed -i "/$escaped_line/d" "$file_to_modify"
done <"$file_to_check"

# Install the Vim-Plug plugin manager and Remove Plugins via it
if [ ! "$(which vim)" = "" ]; then
  vimplug_path="$VIM_AUTOLOAD_PATH/plug.vim"
#   url="\
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
#   vimrc_path="$VIMRC_PATH"

#   alias vi="vim"
#   if [ ! -f "$vimplug_path" ]; then
#     if [ ! "$(which curl)" = "" ]; then
#       c_echo "yellow" "-------------------------------------------------------------------------------"
#       curl -fLo "$vimplug_path" \
#         --create-dirs \
#         "$url" &
#       wait $!

#     c_echo "yellow" "-------------------------------------------------------------------------------"
#     [ -f "$vimrc_path" ] && echo 'Removing VIM Plugins...' && vim -es -u $VIMRC_PATH -i NONE -c "PlugClean" -c "qa"
#     c_echo "yellow" "-------------------------------------------------------------------------------"
#     else
#       echo "[ ERROR ] missing curl. Cant't install plug.vim"
#     fi
#   else
#     c_echo "yellow" "-------------------------------------------------------------------------------"
#     echo Removing VIM Plugins...
#     vim -es -u $VIMRC_PATH -i NONE -c "PlugClean" -c "qa"
#     c_echo "yellow" "-------------------------------------------------------------------------------"
#   fi

  c_echo "yellow" "-------------------------------------------------------------------------------"
  echo Removing VIM Plugins...
  c_echo "yellow" "-------------------------------------------------------------------------------"

  rm -rf ~/.vim/dotplugged
  rm -rf $vimplug_path # Remove vim-plug
  unset vimplug_path url vimrc_path
fi

# cd $VIM_BUNDLE_PATH

# while read line; do
#   if [[ "$line" =~ ^#.*$ ]] || [[ -z "$line" ]]; then
#     continue
#   fi
#   PLUGIN_NAME=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $1}')
#   CLONE_URL=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $2}')
#   DIR_NAME=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $3}')
#   CMD=$(echo $line | awk -F'CMD=' '{print $2}')
#   if [ -z "$DIR_NAME" ]; then
#     DIR_NAME=$PLUGIN_NAME
#     CLONE_PATH=$(eval "echo $VIM_BUNDLE_PATH/$DIR_NAME")
#   else
#     if echo $DIR_NAME | grep -q "CMD="; then
#       DIR_NAME=$PLUGIN_NAME
#       CLONE_PATH=$(eval "echo $VIM_BUNDLE_PATH/$DIR_NAME")
#     else
#       CLONE_PATH=$(eval "echo $DIR_NAME")
#     fi
#   fi

#   if [ -d $CLONE_PATH ]; then
#     echo -------------------------------------------------------------------------------
#     echo Removing $DIR_NAME plugin for Vim
#     rm -rf $CLONE_PATH
#     echo Removed: $CLONE_PATH
#     echo -------------------------------------------------------------------------------
#   fi
# done <$VIM_DEP_FILE_PATH

# cd -
