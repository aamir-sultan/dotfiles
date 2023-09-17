#!/bin/bash

NVIM_PATH="$HOME/.config/nvim"
NVIM_BAK="$HOME/.config/nvim.bak"

echo -------------------------------------------------------------------------------
if [ -d $NVIM_PATH ]; then
  echo $(basename $NVIM_PATH) already available at $(dirname $NVIM_PATH)
  # echo Removing old $NVIM_BAK and Moving $NVIM_PATH to $NVIM_BAK
  # rm -rf $NVIM_BAK
  # mv -f $NVIM_PATH $NVIM_BAK
  # echo Cloning NvChad to $(basename $NVIM_PATH) ...
  # git clone https://github.com/aamir-sultan/NvChad $NVIM_PATH --depth 1
  echo "Updating the NvChad to latest commit"
  echo "Changing path to $NVIM_PATH"
  cd $NVIM_PATH; git pull; cd -
  echo "Back to `pwd`"
else
  echo Cloning NvChad to $(basename $NVIM_PATH) ...
  git clone https://github.com/aamir-sultan/NvChad $NVIM_PATH --depth 1
  echo "Removing the custom dir from the $HOME/.config/nvim/lua/custom/"
  rm -rf $HOME/.config/nvim/lua/custom/
  echo "Symbolic linking $DOTFILES/nvim to $HOME/.config/nvim/lua/custom/"
  ln -s $DOTFILES/nvim $HOME/.config/nvim/lua/custom
fi

echo -------------------------------------------------------------------------------
