# vim: ft=zsh
# shellcheck shell=zsh

local green="%{$F{green}%}"
local red="%{$F{red}%}"
local cyan="%{$F{cyan}%}"
local yellow="%{$F{yellow}%}"
local white="%{$F{white}%}"
local reset="%{$reset_color%}"

get_hostname() {
	echo "${red}%m${reset}"
}

get_username() {
	local color="${green}"
	if [[ $USER == 'root' || $UID == 0 ]]; then
		color="${yellow}"
	fi
	echo "${color}%n${reset}"
}

current_dir() {
	echo "${cyan}%~${reset}"
}

PROMPT="%B$(get_hostname)${white}>${reset}$(get_username) ${white}|${reset} $(current_dir)%b"
PROMPT+="%(?:${green}$:${red}$)${reset} ${reset}"
RPROMPT=""
