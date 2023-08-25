#!/usr/bin/bash

# Check if the DOTFILES is not set
if [ -z "$DOTFILES" ]; then
# Set the DOTFILES path to this script.
    DOTFILES="$(cd "$(dirname "$0")" && pwd)"
fi

# Setup the initial environment for the total setup
source $DOTFILES/system/.variables

#Set the path of the bashrc in the ~/.bashrc if already not exists otherwise print the information
if grep -q "source $DOTFILES/bash/.bashrc"  ~/.bashrc; then
    echo Path already set in $HOME/.bashrc
else
    echo Setting the dotfiles bashrc path into ~/.bashrc    
    echo "source $DOTFILES/bash/.bashrc" >> ~/.bashrc
fi

#Set the path of the bashrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.vimrc
if grep -q "source $DOTFILES/vim/.vimrc"  ~/.vimrc; then
    echo Path already set in $HOME/.vimrc
else
    echo Setting the dotfiles vimrc path in ~/.vimrc
    echo "source $DOTFILES/vim/.vimrc" >> ~/.vimrc
fi
# Dependencies installer script run
#    source ./setup/dependencies_installer.sh
# Vim plugin installer script run
    source $DOTFILES/setup/vim_plugin_installer.sh

#Set the path of the bashrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.tmux.conf
if grep -q "source-file $DOTFILES/tmux/.tmux.conf"  ~/.tmux.conf; then
    echo Path already set in $HOME/.tmux.conf
else
    echo Setting the dotfiles .tmux.conf path in ~/.tmux.conf
    echo "source-file $DOTFILES/tmux/.tmux.conf" >> ~/.tmux.conf
fi


# tmux plugin installer script run
source $(realpath ${DOTFILES})"/setup/tmux_plugin_installer.sh"
# Nvim Installation and setup
source $(realpath ${DOTFILES})"/setup/nvim_setup.sh"

#Set the path of the bashrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.gitconfig
if grep -q "\[include\]" ~/.gitconfig; then
    echo "[include] already set in $HOME/.gitconfig"
    if grep -q "  path = $DOTFILES/git/.git_aliases" ~/.gitconfig; then
        echo Path already set in $HOME/.gitconfig
    else
        echo Setting the dotfiles .git_aliases path in ~/.gitconfig
        echo "  path = $DOTFILES/git/.git_aliases" >> ~/.gitconfig
    fi
else
    echo Setting the dotfiles .git_aliases path in ~/.gitconfig
    echo -e "\n[include]" >> ~/.gitconfig
    echo "  path = $DOTFILES/git/.git_aliases" >> ~/.gitconfig
fi
# Setups the git aliases
    # touch ~/.gitconfig
    # source $DOTFILES/setup/git_setup.sh

# Setup the .dircolors file
DIRCOLORS=.dircolors
FILE_PATH=~/$DIRCOLORS
if test -f "$FILE_PATH"; then
    echo "$FILE_PATH exists."
else
    echo "Copying $DIRCOLORS to $FILE_PATH"
    cp $DOTFILES/system/$DIRCOLORS ~/
fi
