# vim: ft=zsh
# shellcheck shell=zsh
local username_color="%{$F{green}%}"
if [[ $USER == 'root' || $UID == 0 ]]; then
	username_color="%{$F{yellow}%}"
fi

local hostname="%{$F{red}%}${HOST}%{$reset_color%}"
local username="${username_color}%n%{$reset_color%}"
local pwd="%{$F{cyan}%}%c%{$reset_color%}"

PROMPT='%B${hostname}%{F{white}%}>${username} %{$F{white}%}|%{$reset_color%} ${pwd}%b
%(?:%{$F{green}%}$:%{$F{red}%}$)%{$reset_color%} %{$reset_color%}'
