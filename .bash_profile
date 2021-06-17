#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# XDG paths
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME
XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME
XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME
XDG_CONFIG_HOME="$HOME/.config"

# Disable files
export LESSHISTFILE
LESSHISTFILE=-

# Default Apps
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="kitty"
export BROWSER="firefox"
export VIDEO="mpv"
export OPENER="xdg-open"
export PAGER="less"
export WM="i3"

# Start startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
