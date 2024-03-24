# vim: ft=zsh
# shellcheck shell=zsh
local username_color="%{$fg[green]%}"
if [[ $USER == 'root' || $UID == 0 ]]; then
	username_color="%{$fg[yellow]%}"
fi

local hostname="%{$fg[red]%}${HOST}%{$reset_color%}"
local username="${username_color}%n%{$reset_color%}"
local pwd="%{$fg[cyan]%}%c%{$reset_color%}"

PROMPT='%B${hostname}%{$FG[239]%}>${username} %{$FG[239]%}|%{$reset_color%} ${pwd}%b
%(?:%{$fg[green]%}$:%{$fg[red]%}$)%{$reset_color%} %{$reset_color%}'
