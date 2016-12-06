# Tmux mem status

Enables displaying mem percentage and status icon in Tmux status-right.

mem:<br/>
`mem: ❏ 8.7%`

This is done by introducing 2 new format strings that can be added to
`status-right` option:
- `#{mem_icon}` - will display a mem status icon
- `#{mem_percentage}` - will show mem percentage

### Usage

Add `#{mem_icon}` or `#{mem_percentage}` format strings to existing
`status-right` Tmux option. Example:

    # in .tmux.conf
    set -g status-right "mem: #{mem_icon} #{mem_percentage} | %a %h-%d %H:%M "

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'tmux-plugins/tmux-mem'

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/Bosma/tmux-mem ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/mem.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

If format strings are added to `status-right`, they should now be visible.

### Changing icons

By default, these icons are displayed:

 - mem: "❏"

You can change these defaults by adding the following to `.tmux.conf` (the
following lines are not in the code block so that emojis can be seen):

 - set-option -g @mem_icon ":sunglasses:"

Don't forget to reload TMUX environment (`$ tmux source-file ~/.tmux.conf`)
after you do this.

### Limitations

- mem change most likely won't be instant.<br/>
  It will take some time (15 - 60 seconds) for the value to change.
  This depends on the `status-interval` TMUX option.

### License

[MIT](LICENSE)
