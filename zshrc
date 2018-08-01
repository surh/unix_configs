# Mostly defaults from setting up zsh 5.1.1 in Ubuntu 16.04.5 LTS
# I made changes to history and loading of aliases

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

# Keeps history cleaner and shares history between terminals
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# The defualt 1000 lines is too short for me.
# Keep 1000000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILESIZE=2000000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zsh options
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Added this to allow for autocompletion of parent (..) dir. Otherwise
# it hitting tab shows me current directory
zstyle ':completion:*' special-dirs true

# Aliases kept in a separate file (~/.zsh_aliases)
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# Substring matching from history
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"      ]]  && bindkey   "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"    ]]  && bindkey   "${key[Down]}"    down-line-or-beginning-search
