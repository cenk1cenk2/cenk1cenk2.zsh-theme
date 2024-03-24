# vim: ft=zsh
# shellcheck shell=zsh

local green="%{$fg[green]%}"
local red="%{$fg[red]%}"
local cyan="%{$fg[cyan]%}"
local yellow="%{$fg[yellow]%}"
local white="%{$fg[white]%}"
local reset="%{$reset_color%}"

local username_color="${green}"
if [[ $USER == 'root' || $UID == 0 ]]; then
	username_color="${yellow}"
fi

local hostname="${red}%m${reset}"
local username="${username_color}%n${reset}"
local pwd="${cyan}%c${reset}"

PROMPT="%B${hostname}${white}>${reset}${username} ${white}|${reset} ${pwd}%b
%(?:${green}$:${red}$)${reset} ${reset}"
RPROMPT=""
