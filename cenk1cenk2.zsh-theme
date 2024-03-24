# vim: ft=zsh
# shellcheck shell=zsh

local green='%{$F{green}%}'
local red='%{$F{red}%}'
local cyan='%{$F{cyan}%}'
local yellow='%{$F{yellow}%}'
local white='%{$F{white}%}'
local reset='%{$reset_color%}'

local username_color='${green}'
if [[ $USER == 'root' || $UID == 0 ]]; then
	username_color='${yellow}'
fi

local hostname='${red}%m${reset}'
local username='${username_color}%n${reset}'
local pwd='${cyan}%c${reset}'

PROMPT='%B${hostname}${white}>${reset}${username} ${white}|${reset} ${pwd}%b
%(?:${green}$:${red}$)${reset} ${reset}'
RPROMPT=''
