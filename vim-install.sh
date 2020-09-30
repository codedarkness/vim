#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: vim-install.sh
#       USAGE: ./vim-install.sh
#
# DESCRIPTION: install or update vim, copy custome files and
#	       plugins
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-15-2020
#
# -----------------------------------------------------------------

install-vim() {
	echo ""
	echo " Installing Vim"
	echo " Arch Liux | Debian | Void Linux"
	echo ""
	sleep 2

	while true; do
		read -p " Install Vim [y - n] : " yn
		case $yn in
			[Yy]* )
				if ! location="$(type -p "vim")" || [ -z "vim" ]; then

					# check if pacman is installed
					if which pacman > /dev/null 2>&1; then

						sudo pacman -S --noconfirm vim

					# check if apt is installed
					elif which apt > /dev/null 2>&1; then

						sudo apt install -y vim-nox

					# check if xbps is installed
					elif which xbps-install > /dev/null 2>&1; then

						sudo xbps-install -Sy vim-huge

					else

						echo " Your system is not supported"
					fi

					else
						echo " Nothing to do! Vim is installed in your System"
				fi ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
}

copy-files() {
	echo ""
	echo " Getting ready to copy vim config files"
	echo ""
	sleep 2;

	## autoload directory
	### Check for dir, if not found create it using the mkdir ###
	dldir="$HOME/.vim/autoload"
	[ ! -d "$dldir" ] && mkdir -p "$dldir" &&
	echo " autoload directory was created" || echo " $dldir already exist!"
	echo ""

	## UltiSnips directory
	### Check for dir, if not found create it using the mkdir ###
	dldir2="$HOME/.vim/UltiSnips"
	[ ! -d "$dldir2" ] && mkdir -p "$dldir2" &&
	echo " UltiSnips directory was created" || echo " $dldir2 already exist!"
	echo ""

	## bundle directory
	### Check for dir, if not found create it using the mkdir ###
	dldir3="$HOME/.vim/bundle"
	[ ! -d "$dldir3" ] && mkdir -p "$dldir3" &&
	echo " bundle directory was created" || echo " $dldir3 already exist!"
	echo ""

	cp -af config-files/configs/plug.vim $HOME/.vim/autoload/ &&
	echo " plug.vim was copied" || echo " Sssshhhhh!!"
	echo ""

	cp -af config-files/configs/all.snippets $HOME/.vim/UltiSnips &&
	echo " general snippets file was copied" || echo " Not again!!!"
	echo ""

	cp -ar config-files/configs/vimrc $HOME/.vimrc &&
	echo " vimrc was copied" || echo " Don't worry is your system, not you!"
	echo ""
}

edit-vimrc() {
	echo ""
	echo " Edit Vimcr in your local machine"
	echo ""
	sleep 2

	while true; do
		read -p " Edit vimrc [y - n] : " yn
		case $yn in
			[Yy]* )
				vim ~/.vimrc; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
}

press_enter() {
	echo ""
	echo -n " Press Enter To Continue"
	read
	clear
}

incorrect_selection() {
	echo " Incorrect selection! try again"
}

until [ "$selection" = "0" ]; do
	clear
	echo ""
	echo " DarknessCode"
	echo "        _            "
	echo "       (_)           "
	echo " __   ___ _ __ ___   "
	echo " \ \ / / | '_ ' _ \  "
	echo "  \ V /| | | | | | | "
	echo "   \_/ |_|_| |_| |_| "
	echo ""
	echo " The ubiquitous text editor"
	echo ""
	echo " 1 - Install"
	echo " 2 - Copy (custom) config files"
	echo " 3 - Edit Vimrc file (local)"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-vim  ; press_enter ;;
		2) clear; copy-files   ; press_enter ;;
		3) clear; edit-vimrc   ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
