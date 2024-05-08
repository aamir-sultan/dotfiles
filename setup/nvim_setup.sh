#!/bin/bash

NVIM_PATH="$HOME/.config/nvim"
NVIM_BAK="$HOME/.config/nvim.bak"
CONFIG_NAME="$NVIM_CONFIG"

get_new_clones(){
  if [[ "$CONFIG_NAME" == "NvChad" ]]; then
    echo Cloning $CONFIG_NAME to $(basename $NVIM_PATH) ...
    git clone --depth 1 https://github.com/aamir-sultan/NvChad $NVIM_PATH
    echo "Removing the custom dir from the $HOME/.config/nvim/lua/custom"
    rm -rf $HOME/.config/nvim/lua/custom
    echo "Symbolic linking $DOTFILES/nvim/nvchad to $HOME/.config/nvim/lua/custom"
    ln -s $DOTFILES/nvim/nvchad/ $HOME/.config/nvim/lua/custom

  elif [[ "$CONFIG_NAME" == "LazyVim" ]]; then
    # echo Cloning $CONFIG_NAME to $(basename $NVIM_PATH) ...
    # git clone --depth 1 https://github.com/aamir-sultan/LazyVim-Starter $NVIM_PATH
    echo "Removing the nvim dir from the $HOME/.config/nvim"
    rm -rf $HOME/.config/nvim
    echo "Symbolic linking $DOTFILES/nvim/lazyvim to $HOME/.config/nvim"
    ln -s $DOTFILES/nvim/lazyvim/ $HOME/.config/nvim

  elif [[ "$CONFIG_NAME" == "KickStart" ]]; then
    # Add Tj Devries Kickstart settings for default
    echo Cloning $CONFIG_NAME to $(basename $NVIM_PATH) ...
    git clone --depth 1 https://github.com/nvim-lua/kickstart.nvim.git $NVIM_PATH
  fi
}

update_clones(){
  if [[ "$CONFIG_NAME" == "NvChad" ]]; then
    echo "Updating the $CONFIG_NAME to latest commit"
    echo "Changing path to $NVIM_PATH"
    cd $NVIM_PATH
    git pull
    cd -
    echo "Back to $(pwd)"

  elif [[ "$CONFIG_NAME" == "LazyVim" ]]; then
    echo "Updating the $CONFIG_NAME -- Removing older symlinks"
    rm -rf $HOME/.config/nvim
    echo Creating new symlinks for $CONFIG_NAME
    ln -s $DOTFILES/nvim/lazyvim/ $HOME/.config/nvim

  elif [[ "$CONFIG_NAME" == "KickStart" ]]; then
  echo "Updating the $CONFIG_NAME to latest commit"
    echo "Changing path to $NVIM_PATH"
    cd $NVIM_PATH
    git pull
    cd -
    echo "Back to $(pwd)"
  fi
}

echo -------------------------------------------------------------------------------
if [ -d $NVIM_PATH ]; then
  echo $(basename $NVIM_PATH) already available at $(dirname $NVIM_PATH)
# Directory exist which means it was previously installed but we have very less margin of knowing
# config was installed
  if [[ "$CONFIG_NAME" != "$NVIM_CONFIG_DEFAULT" ]]; then
    echo "Removing older copy of configuration"
    # mv -f $NVIM_PATH $NVIM_BAK
    rm -rf $NVIM_PATH
    get_new_clones
  else
    update_clones
  fi

else
# Since the directory is not available, we need to get new clones
  mkdir -p $HOME/.config
  get_new_clones
fi

echo -------------------------------------------------------------------------------
