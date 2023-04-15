# vim: ft=zsh
# shellcheck shell=zsh
autoload -Uz add-zsh-hookgit

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

get_space_size() {
	local str="$1"
	local zero_pattern='%([BSUbfksu]|([FB]|){*})'
	local len=${#${(S%%)str//$~zero_pattern/}}
	local size=$(( $COLUMNS - $len ))
	echo "$size"
}

align_right() {
	local str="$1"
	local align_site=`get_space_size "$str"`
	local cursor_back="\033[${align_site}G"
	local cursor_begin="\033[1G"
	echo "${cursor_back}${str}${cursor_begin}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}+"

local ZSH_PROMPT_HEAD='%{$fg[239]%}[$(get_host_name)%{$fg[239]%}>$(get_user_name)%{$fg[239]%}] %{$fg[239]%}|%{$reset_color%} $(current_dir)'
local ZSH_PROMPT_HEAD_RIGHT='$(align_right " `git_prompt_info`")'

local ZSH_PROMPT_FOOT=''

PROMPT="%B${ZSH_PROMPT_HEAD_RIGHT}${ZSH_PROMPT_HEAD}%b
%(?:%{$fg[green]%}$:%{$fg[red]%}$)%{$reset_color%} $ZSH_PROMPT_FOOT%{$reset_color%}"
