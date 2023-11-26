#!/bin/bash

# Install the Vim-Plug plugin manager
if [ ! "$(which vim)" = "" ]; then
  vimplug_path="$VIM_AUTOLOAD_PATH/plug.vim"
  url="\
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  vimrc_path="$VIMRC_PATH"

  alias vi="vim"
  if [ ! -f "$vimplug_path" ]; then
    if [ ! "$(which curl)" = "" ]; then
      c_echo "yellow" "-------------------------------------------------------------------------------"
      curl -fLo "$vimplug_path" \
        --create-dirs \
        "$url" &
      wait $!

    c_echo "yellow" "-------------------------------------------------------------------------------"
    [ -f "$vimrc_path" ] && echo 'Installing VIM Plugins...' && vim -es -u $VIMRC_PATH -i NONE -c "PlugInstall" -c "qa"
    c_echo "yellow" "-------------------------------------------------------------------------------"
    [ -f "$vimrc_path" ] && echo 'Updating VIM Plugins...' && vim -es -u $VIMRC_PATH -i NONE -c "PlugUpdate" -c "qa"
    c_echo "yellow" "-------------------------------------------------------------------------------"
    else
      echo "[ ERROR ] missing curl. Cant't install plug.vim"
    fi
  else
    c_echo "yellow" "-------------------------------------------------------------------------------"
    echo Installing VIM Plugins...
    vim -es -u $VIMRC_PATH -i NONE -c "PlugInstall" -c "qa"
    # vim -e -u $VIMRC_PATH -i NONE -c "PlugInstall" -c "qa"
    c_echo "yellow" "-------------------------------------------------------------------------------"
    echo Updating VIM Plugins...
    vim -es -u $VIMRC_PATH -i NONE -c "PlugUpdate" -c "qa"
    # vim -e -u $VIMRC_PATH -i NONE -c "PlugUpdate" -c "qa"
    c_echo "yellow" "-------------------------------------------------------------------------------"
  fi

  unset vimplug_path url vimrc_path
fi

# # Install the pathogen plugin manager
# mkdir -p $VIM_AUTOLOAD_PATH $VIM_BUNDLE_PATH &&
#   curl -LSso $VIM_AUTOLOAD_PATH/pathogen.vim https://tpo.pe/pathogen.vim

# cd $VIM_BUNDLE_PATH

# while read line; do
#   if [[ "$line" =~ ^#.*$ ]] || [[ -z "$line" ]]; then
#     continue
#   fi
#   # echo "$line"

#   c_echo "yellow" "-------------------------------------------------------------------------------"
#   # SPLITS=$(echo $line | awk -F'[[:space:]]' '{print "PLUGIN_NAME="$1, "CLONE_URL="$2, "DIR_NAME="$3, "CLONE_PATH="$4}')
#   PLUGIN_NAME=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $1}')
#   CLONE_URL=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $2}')
#   DIR_NAME=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $3}')
#   # CLONE_PATH=$(echo $line | awk -F'[[:space:]]' '{print $4}')
#   CMD=$(echo $line | awk -F'CMD=' '{print $2}')

#   # echo $SPLITS
#   echo "Plugin Name:    $PLUGIN_NAME"
#   echo "Clone URL:      $CLONE_URL"
#   echo "Directory Path: $DIR_NAME"
#   echo "Extra Command:  $CMD"
#   echo -e "\n"

#   # CLONE_PATH=$(eval "echo $CLONE_PATH")

#   echo Checking $PLUGIN_NAME repo if it is already installed
#   if [ -z "$DIR_NAME" ]; then
#     # echo "DIR_NAME is empty"
#     DIR_NAME=$PLUGIN_NAME
#     echo "DIR_NAME empty. Corrected to: $DIR_NAME"
#     CLONE_PATH=$(eval "echo $VIM_BUNDLE_PATH/$DIR_NAME")
#   else
#     if echo $DIR_NAME | grep -q "CMD="; then
#       # echo "DIR_NAME is wrong: $DIR_NAME"
#       DIR_NAME=$PLUGIN_NAME
#       echo "DIR_NAME Wrong. Corrected to: $DIR_NAME"
#       CLONE_PATH=$(eval "echo $VIM_BUNDLE_PATH/$DIR_NAME")
#     else
#       echo "DIR_NAME is not empty and is set to: $DIR_NAME"
#       CLONE_PATH=$(eval "echo $DIR_NAME")
#       echo "CLONE_PATH evaluated to $CLONE_PATH"
#     fi
#   fi

#   if [ -d $CLONE_PATH ]; then
#     echo $(basename $DIR_NAME) already available at $(dirname $CLONE_PATH)
#   else
#     echo Working on $(basename $DIR_NAME) ...
#     git clone $CMD $CLONE_URL $CLONE_PATH
#   fi
#   c_echo "yellow" "-------------------------------------------------------------------------------"
# done <$VIM_DEP_FILE_PATH

# echo Back to:
# cd -
