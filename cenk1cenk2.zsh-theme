# vim: ft=zsh
# shellcheck shell=zsh
get_host_name() { echo "%{$fg[red]%}%m%{$reset_color%}"; }

get_user_name() {
	local name_prefix="%{$fg[green]%}"
	if [[ $USER == 'root' || $UID == 0 ]]; then
		name_prefix="%{$fg[yellow]%}"
	fi
	echo "${name_prefix}%n%{$reset_color%}"
}

current_dir() {
	echo "%{$fg[cyan]%}%~%{$reset_color%}"
}

local ZSH_PROMPT_HEAD='$(get_host_name)%{$FG[239]%}>$(get_user_name) %{$FG[239]%}|%{$reset_color%} $(current_dir)'
local ZSH_PROMPT_FOOT=''

PROMPT="%B${ZSH_PROMPT_HEAD}%b
%(?:%{$fg[green]%}$:%{$fg[red]%}$)%{$reset_color%} $ZSH_PROMPT_FOOT%{$reset_color%}"
