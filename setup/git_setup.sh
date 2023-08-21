#!/usr/bin/bash
GIT_CONFIG=~/.gitconfig

if [ -f "$GIT_CONFIG" ]; then
    echo "$GIT_CONFIG exists."
    if grep -qE "sclone|sup|spush" $GIT_CONFIG; then
        echo Git aliases already set in $GIT_CONFIG. Nothing to do.
    else
        echo Setting the git aliases in $GIT_CONFIG 
        cat $DOTFILES/git/.git_aliases >> $GIT_CONFIG  
    fi
else
    echo Setting the git aliases in $GIT_CONFIG 
    cat $DOTFILES/git/.git_aliases >> $GIT_CONFIG  
fi
