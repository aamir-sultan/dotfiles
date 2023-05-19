#!/bin/bash

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# ln -s /home/r2d2/dotfiles/nvim/chadrc.lua /home/r2d2/.config/nvim/lua/custom/chadrc.lua
# ln -s /home/r2d2/dotfiles/nvim/init.lua /home/r2d2/.config/nvim/lua/custom/init.lua
# ln -s /home/r2d2/dotfiles/nvim/plugins.lua /home/r2d2/.config/nvim/lua/custom/plugins.lua
# ln -s /home/r2d2/dotfiles/nvim/mappings.lua /home/r2d2/.config/nvim/lua/custom/mappings.lua
rm -rf $HOME/.config/nvim/lua/custom/
ln -s $DOTFILES/nvim $HOME/.config/nvim/lua/custom
