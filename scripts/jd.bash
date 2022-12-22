#!/bin/bash
#
# To get this to work, in bashrc set SYSTEM_SCRIPTS to the parent directory of jd.bash
# and then source jd.bash.
# Entering jd into a prompt will call the function jd below.
# jd must be a function, inorder for cd to change the directory of the parent process.
#

function jd() {
	case "$1" in
		"")
		python "${SYSTEM_SCRIPTS}/jumpdir.py"
		;;

		"-l")
		python "${SYSTEM_SCRIPTS}/jumpdir.py"
		;;

		"--help")
		python "${SYSTEM_SCRIPTS}/jumpdir.py" "$1"
		;;

		"-h")
		python "${SYSTEM_SCRIPTS}/jumpdir.py" "$1"
		;;

		"-s")
		python "${SYSTEM_SCRIPTS}/jumpdir.py" "$1"
		;;

		"-r")
		python "${SYSTEM_SCRIPTS}/jumpdir.py" "$1"
		;;

		*)
		a=$(python "${SYSTEM_SCRIPTS}/jumpdir.py" "$1")
		cd "$a" || return
		;;
	esac
}
