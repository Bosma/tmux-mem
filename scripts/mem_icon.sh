#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
mem_icon=""

mem_default="❏ "

# icons are set as script global variables
get_icon_settings() {
	mem_icon=$(get_tmux_option "@mem_icon" "$mem_default")
}

main() {
	get_icon_settings
	printf "$mem_icon"
}
main
