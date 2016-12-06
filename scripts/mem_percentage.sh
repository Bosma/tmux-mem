#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_mem_percentage() {
  free | grep Mem | awk '{printf(" %.2f%%", $3/$2 * 100.0)}'
}

main() {
	print_mem_percentage
}
main
