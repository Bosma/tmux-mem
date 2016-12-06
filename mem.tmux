#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

mem_percentage="#($CURRENT_DIR/scripts/mem_percentage.sh)"
mem_icon="#($CURRENT_DIR/scripts/mem_icon.sh)"
mem_percentage_interpolation="\#{mem_percentage}"
mem_icon_interpolation="\#{mem_icon}"

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local string=$1
	local percentage_interpolated=${string/$mem_percentage_interpolation/$mem_percentage}
	local all_interpolated=${percentage_interpolated/$mem_icon_interpolation/$mem_icon}
	echo $all_interpolated
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
