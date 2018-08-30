# Theme file to work with oh my zsh
# Place in "~/.oh-my-zsh/themes/"
# Activate by setting ZSH="sur" in .zshrc

local ret_status="%(?:%{$fg_bold[green]%}→ :%{$fg_bold[red]%}→ )"
PROMPT='
$fg_bold[blue]%n%{$reset_color%}$fg[cyan]@%m: $fg[yellow]$(get_pwd) $(git_prompt_info)
${ret_status}%{$reset_color%}'

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}⚠"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
