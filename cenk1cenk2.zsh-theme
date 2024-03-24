# vim: ft=zsh
# shellcheck shell=zsh

local green="%F{green%}"
local red="%F{red%}"
local cyan="%F{cyan%}"
local yellow="%F{yellow%}"
local white="%F{white%}"
local reset="%f"

local hostname="${red}%m${reset}"
local username_color="${green}"
if [[ $USER == 'root' || $UID == 0 ]]; then
	username_color="${yellow}"
fi
local username="${username_color}%n${reset}"
local dir="${cyan}%~${reset}"

PROMPT="%B${hostname}${white}>${reset}${username} ${white}|${reset} ${dir}%b
%(?:${green}$:${red}$)${reset} ${reset}"
RPROMPT=""
