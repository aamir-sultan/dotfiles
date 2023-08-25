#!/usr/bin/bash

# Install the tmux plugin manager
mkdir -p $TMUX_TPM_PATH && \
cd $TMUX_TPM_PATH 

while read line
do
  if [[ "$line" =~ ^#.*$ ]] || [[ -z "$line" ]]
  then
    continue
  fi
  # echo "$line"

  echo -------------------------------------------------------------------------------
  # SPLITS=$(echo $line | awk -F'[[:space:]]' '{print "PLUGIN_NAME="$1, "CLONE_URL="$2, "DIR_NAME="$3, "CLONE_PATH="$4}')
  PLUGIN_NAME=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $1}')
  CLONE_URL=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $2}')
  DIR_NAME=$(echo $line | awk -F'CMD=' '{print $1}' | awk -F'[[:space:]]' '{print $3}')
  # CLONE_PATH=$(echo $line | awk -F'[[:space:]]' '{print $4}')
  CMD=$(echo $line | awk -F'CMD=' '{print $2}')

  # echo $SPLITS
  echo "Plugin Name:    $PLUGIN_NAME"
  echo "Clone URL:      $CLONE_URL"
  echo "Directory Path: $DIR_NAME"
  echo "Extra Command:  $CMD"
  echo -e "\n"

  # CLONE_PATH=$(eval "echo $CLONE_PATH")

  echo Checking $PLUGIN_NAME repo if it is already installed
  if [ -z "$DIR_NAME" ]; then
    # echo "DIR_NAME is empty"
    DIR_NAME=$PLUGIN_NAME
    echo "DIR_NAME empty. Corrected to: $DIR_NAME"
    CLONE_PATH=$(eval "echo $TMUX_TPM_PATH/$DIR_NAME")
  else
    if echo $DIR_NAME | grep -q "CMD="; then
      # echo "DIR_NAME is wrong: $DIR_NAME"
      DIR_NAME=$PLUGIN_NAME
      echo "DIR_NAME Wrong. Corrected to: $DIR_NAME"
      CLONE_PATH=$(eval "echo $TMUX_TPM_PATH/$DIR_NAME")
    else
      echo "DIR_NAME is not empty and is set to: $DIR_NAME"
      CLONE_PATH=$(eval "echo $DIR_NAME")
      echo "CLONE_PATH evaluated to $CLONE_PATH"
    fi
  fi

  if [ -d $CLONE_PATH ]; then
    echo $(basename $DIR_NAME) already available at $(dirname $CLONE_PATH)
  else
    echo Working on $(basename $DIR_NAME) ...
    git clone $CMD $CLONE_URL $CLONE_PATH
  fi
echo -------------------------------------------------------------------------------
done < $TMUX_DEP_FILE_PATH
echo Back to:
cd -
