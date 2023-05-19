#!/usr/bin/bash

# Install Fuzzy Finder and setup the paths

cd ~
for dir in ~/{.fzf,dummy}; do
   echo -------------------------------------------------------------------------------
   echo Checking $(basename $dir) repo if it is already installed

   if [ -d $(basename $dir) ]; then
       echo $(basename $dir) already available 
   else
       echo Working on $(basename $dir) ...
       case $(basename $dir) in
          
           .fzf)
               git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
               ~/.fzf/install
               ;;
                
           esac
   fi
done
unset dir

cd -
