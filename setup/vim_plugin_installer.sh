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
