#neofetch

HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
setopt autocd extendedglob
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/me/.zshrc'

autoload -Uz compinit
compinit

alias ood="sudo pacman -Syu"
alias gimme="sudo pacman -S"
alias vim='nvim'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ip='ip -c'
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'





# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}%Th%b %B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# Flush history after every command. This will save any command regardless of which terminal is closed last
export PROMPT_COMMAND='history -a'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Enable typing + [Up-Arrow] or [Down-Arror] = fuzzy find history forward or backward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi



# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line




autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[3;5~' kill-word



#unsetopt beep
 export PATH="/home/c3po/.cargo/bin:$PATH"
export BEMENU_OPTS="--tb '#6272a4'\
 --tf '#f8f8f2'\
 --fb '#282a36'\
 --ff '#f8f8f2'\
 --nb '#282a36'\
 --nf '#6272a4'\
 --hb '#44475a'\
 --hf '#50fa7b'\
 --sb '#44475a'\
 --sf '#50fa7b'\
 --scb '#282a36'\
 --scf '#ff79c6'"

function reload(){
       source ~/.zshrc
       source ~/.zshenv
       ...
   }

PATH="/home/c3po/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/c3po/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/c3po/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/c3po/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/c3po/perl5"; export PERL_MM_OPT;

#Tmux for SSH
#function ssh () {/usr/bin/ssh -t "$@" "tmux attach || tmux new";}

export TERM=xterm-256color
