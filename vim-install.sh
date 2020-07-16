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

arch-based() {
	echo ""
	echo " Installing or update vim - ArchBased systems"
	echo ""
	sleep 2;

	pacman -Qs vim &&
	echo " vim is installed and updated" ||
	sudo pacman -S --nonconfirmation -needed vim
	echo ""
}

debian-based() {
	echo ""
	echo " Installing or update vim - DebianBased systems"
	echo ""
	sleep 2;

	dpkg -l | grep vim &&
	echo " vim is installed and update" ||
	sudo apt install -y vim
	echo ""
}

config-files() {
	echo ""
	echo " Getting ready to copy vim config files"
	echo ""
	sleep 2;

	cp -ar config-files/vim/ $HOME/.vim/ &&
	echo " ##### vim directory and plugins was copied" || echo " Upssss!"
	echo ""

	cp -ar config-files/vimrc $HOME/.vimrc &&
	echo " ##### vimrc was copied" || echo " Don't worry is your system, not you!"
	echo ""

	mkdir ~/.vim/bundle/ &&
	echo " bundle directory has been created" || echo " something is wrong"
	echo ""
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
	echo " 1 - Install in Arch Based"
	echo " 2 - Install in Debian Based"
	echo " 3 - Copy (custom) config files"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; arch-based   ; press_enter ;;
		2) clear; debian-based ; press_enter ;;
		3) clear; config-files ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
