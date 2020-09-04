# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
export HOME=/home1/irteam/workspace/bgsn
export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:/bin

export C_INCLUDE_PATH=$HOME/local/include:/include
export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

export LD_LIBRARY_PATH=$HOME/local/lib:/lib64:/lib

# Shell
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

fpath=($HOME/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# no remove postfix slash of command line
setopt noautoremoveslash

# compacked complete list display
setopt list_packed

# no beep sound when complete list displayed
setopt nolistbeep

# magic complete
setopt magic_equal_subst

# expand aliases before completing
setopt complete_aliases     # aliased ls needs if file/dir completions work

## terminal configuration
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

autoload colors
colors

# Keybind
bindkey -e
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

## For tmux
export TMUX_TMPDIR=$HOME/.tmux.d/tmp

## Anasconda
test -e ~/anaconda3/etc/profile.d/conda.sh && . ~/anaconda3/etc/profile.d/conda.sh
export PATH="$PATH:$HOME/anaconda3/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/anaconda3/lib

## :
if [ -f $HOME/.local/bin/powerline-daemon ]; then
    $HOME/.local/bin/powerline-daemon -q
    . $HOME/.src/powerline/powerline/bindings/zsh/powerline.zsh
fi


# For ssh-agent
SSH_AGENT_FILE=$HOME/.ssh-agent
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
if ! ssh-add -l > /dev/null 2>&1; then
    ssh-agent > $SSH_AGENT_FILE
    source $SSH_AGENT_FILE
    ssh-add $HOME/.ssh/id_rsa
fi

# For highlight
# source $HOME/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh.d/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# For Peco
[ -f $HOME/.zsh.d/peco.zshrc ] && source $HOME/.zsh.d/peco.zshrc

# For autosuggestion
autosuggestions=$HOME/.zsh.d/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -e $autosuggestions ]; then
    source $autosuggestions
fi

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# # zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

alias ls="ls --color"
alias vi="vim"

# For Cuda
export CUDA_HOME=/usr/local/cuda-9.0
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# For Theme
## powerlevel
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $HOME/.src/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.zsh.d/.p10k.zsh ]] || source ~/.zsh.d/.p10k.zsh
