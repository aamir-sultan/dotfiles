#!/usr/bin/bash

GIT_CONFIG=~/.gitconfig
IGNORE_FILE=".gitignore"
IGNORE_FILE_PATH=$(realpath ${DOTFILES}/git)/$IGNORE_FILE
touch $GIT_CONFIG

echo "Working in the file: $GIT_CONFIG"

if grep -q "\[include\]" $GIT_CONFIG; then
  echo "[include] already set in $HOME/.gitconfig"
  if grep -q "  path = $DOTFILES/git/.git_aliases" $GIT_CONFIG; then
    echo Path for aliases file already set in $HOME/.gitconfig
  else
    echo Setting the dotfiles .git_aliases path in $GIT_CONFIG
    echo "  path = $DOTFILES/git/.git_aliases" >> $GIT_CONFIG
  fi
else
  echo Setting the dotfiles .git_aliases path in $GIT_CONFIG
  echo -e "\n[include]" >> $GIT_CONFIG
  echo "  path = $DOTFILES/git/.git_aliases" >> $GIT_CONFIG
fi

if grep -q "\[core\]" $GIT_CONFIG; then
echo "[core] already set in $HOME/.gitignore"
  if grep -q "  excludesfile = $IGNORE_FILE_PATH" $GIT_CONFIG; then
    echo Path for ignore file already set in $HOME/.gitconfig
  else
    # REPLACEMENT_TEXT="\tThis is the replacement text."
    # Create a temporary file to store the output
    TMP_FILE=$(mktemp)

    readarray -t lines < "$GIT_CONFIG"
    # Iterate over the lines in the array
    for LINE in "${lines[@]}"; do

      # Check if the LINE contains the "[core]" string
      if grep -q "\[core\]" <<< $LINE; then

        # If the LINE contains the "[core]" string, write the replacement text to the temporary file on the next LINE
        echo "$LINE" >> "$TMP_FILE"
        echo "  excludesfile = $IGNORE_FILE_PATH" >> "$TMP_FILE"
      else
        # If the LINE does not contain the "[core]" string, write it to the temporary file
        echo "$LINE" >> "$TMP_FILE"
      fi
    done
    # Move the temporary file to the original file
    mv "$TMP_FILE" "$GIT_CONFIG"
  fi
else
  echo Setting the dotfiles .git_aliases path in $GIT_CONFIG
  echo -e "\n[core]" >> $GIT_CONFIG
  echo "  excludesfile = $IGNORE_FILE_PATH" >> $GIT_CONFIG
fi