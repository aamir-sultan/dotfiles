#!/usr/bin/bash

# Setup the initial environment for the total setup
source $DOTFILES/system/.variables

#Set the path of the bashrc in the ~/.bashrc if already not exists otherwise print the information
if grep -q 'source ~/dotfiles/bash/.bashrc'  ~/.bashrc; then
    echo Path already set in $HOME/.bashrc
else
    echo Setting the dotfiles bashrc path into ~/.bashrc    
    echo "source $DOTFILES/bash/.bashrc" >> ~/.bashrc
fi

#Set the path of the bashrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.vimrc
if grep -q 'source ~/dotfiles/vim/.vimrc'  ~/.vimrc; then
    echo Path already set in $HOME/.vimrc
else
    echo Setting the dotfiles vimrc path in ~/.vimrc
    echo 'source ~/dotfiles/vim/.vimrc' >> ~/.vimrc
fi
# Dependencies installer script run
#    source ./setup/dependencies_installer.sh
# Vim plugin installer script run
    source $DOTFILES/setup/vim_plugin_installer.sh

#Set the path of the bashrc in the ~/.vimrc if already not exists otherwise print the information
touch ~/.tmux.conf
if grep -q 'source-file ~/dotfiles/tmux/.tmux.conf'  ~/.tmux.conf; then
    echo Path already set in $HOME/.tmux.conf
else
    echo Setting the dotfiles .tmux.conf path in ~/.tmux.conf
    echo 'source-file ~/dotfiles/tmux/.tmux.conf' >> ~/.tmux.conf
fi

# tmux plugin installer script run
source $(realpath ${DOTFILES})"/setup/tmux_plugin_installer.sh"
# Nvim Installation and setup
source $(realpath ${DOTFILES})"/setup/nvim_setup.sh"

# Setups the git aliases
    touch ~/.gitconfig
    source $DOTFILES/setup/git_setup.sh

# Setup the .dircolors file
DIRCOLORS=.dircolors
FILE_PATH=~/$DIRCOLORS
if test -f "$FILE_PATH"; then
    echo "$FILE_PATH exists."
else
    echo "Copying $DIRCOLORS to $FILE_PATH"
    cp $DOTFILES/system/$DIRCOLORS ~/
fi
