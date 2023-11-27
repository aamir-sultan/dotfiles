#!/usr/bin/bash

# Check if the DOTFILES is not set
if [ -z "$DOTFILES" ]; then
  # Set the DOTFILES path to this script.
  DOTFILES="$(cd "$(dirname "$0")" && pwd)"
fi

# Define a function for colored echo
c_echo() {
  local color="$1"
  local message="$2"
  local reset="\033[0m" # Reset to default text color

  case "$color" in
  "red")
    echo -e "\033[31m$message$reset"
    ;;
  "green")
    echo -e "\033[32m$message$reset"
    ;;
  "yellow")
    echo -e "\033[33m$message$reset"
    ;;
  "blue")
    echo -e "\033[34m$message$reset"
    ;;
  "magenta")
    echo -e "\033[35m$message$reset"
    ;;
  "cyan")
    echo -e "\033[36m$message$reset"
    ;;
  *)
    echo "Invalid color. Usage: colored_echo <color> <message>"
    return 1
    ;;
  esac
}

echo_pwd() {
c_echo "yellow" "-------------------------------------------------------------------------------"
echo "Back to `pwd`"
c_echo "yellow" "-------------------------------------------------------------------------------"
}

# Setup the initial environment for the total setup
source $DOTFILES/system/.variables

#Set the path of the bashrc in the ~/.bashrc if already not exists otherwise print the information
if grep -q "source $DOTFILES/bash/.bashrc" ~/.bashrc; then
  echo Path already set in $HOME/.bashrc
else
  echo Setting the dotfiles bashrc path into ~/.bashrc
  echo "source $DOTFILES/bash/.bashrc" >>~/.bashrc
fi

#Set the path of the dotfiles/.vimrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.vimrc
if grep -q "source $DOTFILES/vim/.vimrc" ~/.vimrc; then
  echo Path already set in $HOME/.vimrc
else
  echo Setting the dotfiles vimrc path in ~/.vimrc
  echo "source $DOTFILES/vim/.vimrc" >>~/.vimrc
fi
# Dependencies installer script run
#    source ./setup/dependencies_installer.sh
# Vim plugin installer script run
source $DOTFILES/setup/vim_plugin_installer.sh
echo_pwd

#Set the path of the bashrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.tmux.conf
if grep -q "source-file $DOTFILES/tmux/.tmux.conf" ~/.tmux.conf; then
  echo Path already set in $HOME/.tmux.conf
else
  echo Setting the dotfiles .tmux.conf path in ~/.tmux.conf
  echo "source-file $DOTFILES/tmux/.tmux.conf" >>~/.tmux.conf
fi

# tmux plugin installer script run
source $(realpath ${DOTFILES})"/setup/tmux_plugin_installer.sh"
echo_pwd

# Nvim Installation and setup
source $(realpath ${DOTFILES})"/setup/nvim_setup.sh"
echo_pwd

# Setups the git aliases
touch ~/.gitconfig
source $DOTFILES/setup/git_setup.sh
echo_pwd

# Setup the .dircolors file
DIRCOLORS=.dircolors
FILE_PATH=~/$DIRCOLORS
if test -f "$FILE_PATH"; then
  echo "$FILE_PATH exists."
else
  echo "Copying $DIRCOLORS to $FILE_PATH"
  cp $DOTFILES/system/$DIRCOLORS ~/
fi
echo_pwd
