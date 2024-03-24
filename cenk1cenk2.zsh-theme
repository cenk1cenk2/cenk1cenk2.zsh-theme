# vim: ft=zsh
# shellcheck shell=zsh

get_host_name() { echo "%{$F{red}%}%m%{$reset_color%}"; }

get_user_name() {
	local name_prefix="%{$F{green}%}"
	if [[ $USER == 'root' || $UID == 0 ]]; then
		name_prefix="%{$F{yellow}%}"
	fi
	echo "${name_prefix}%n%{$reset_color%}"
}

current_dir() {
	echo "%{$F{cyan}%}%~%{$reset_color%}"
}

local ZSH_PROMPT_HEAD='$(get_host_name)%{$F{white}%}>$(get_user_name) %{$F{white}%}|%{$reset_color%} $(current_dir)'
local ZSH_PROMPT_FOOT=''

PROMPT="%B${ZSH_PROMPT_HEAD}%b
%(?:%{$F{green}%}$:%{$F{red}%}$)%{$reset_color%} $ZSH_PROMPT_FOOT%{$reset_color%}"
