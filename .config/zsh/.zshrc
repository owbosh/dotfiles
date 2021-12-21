autoload -U colors && colors

PROMPT="%B%n%b %F{#caa9fa}%d%f > " # two-sided prompt
RPROMPT="[%F{#8be9fd}%?%f]" # exit status on the right

setopt autocd # cd by only typing the directory
stty stop undef	# disable ctrl-s to freeze terminal

# better compatibility with st
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

HISTSIZE=10000000 && SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

fzfcd () {
	dir=$(find ~/ \( -path ~/.cache -o -path ~/.config/BraveSoftware/Brave-Browser \) -prune -o -type d | fzf)
	if [ ! -z "$dir" ]; then cd $dir; fi
}
bindkey -s '^p' 'fzfcd\n'

fzfo () {	
	file=$(find ~/ \( -path ~/.cache -o -path ~/.config/BraveSoftware/Brave-Browser \) -prune -o -type f | fzf)
	if [ ! -z "$file" ]; then xdg-open $file; fi
}
bindkey -s '^o' 'fzfo\n'

alias pac-clean='sudo pacman -Qtdq | sudo pacman -Rns '

alias c='clear'
alias vim='nvim'
alias startx='startx "~/.config/X11/xinitrc"'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
alias lf='lfrun'
alias wget='wget --hsts-file="~/.cache/wget-hsts"'
alias kms='loginctl terminate-user $USER'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias discord='discord --disable-smooth-scrolling'
alias poly='killall polybar && polybar owbar & disown'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
