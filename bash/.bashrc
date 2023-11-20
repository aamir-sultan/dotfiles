unset DOTFILES
# Check if the DOTFILES is not set
if [ -z "$DOTFILES" ]; then
    # Set the DOTFILES path to the this script and one step beyond.
    DOTFILES="$(dirname -- "${BASH_SOURCE[0]}")/../"
fi
[ -n "$PS1" ] && source $DOTFILES/bash/.bash_profile
