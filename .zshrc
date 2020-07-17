# PATH
export HOME=/home1/irteam/workspace/park
export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

export C_INCLUDE_PATH=$HOME/local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

export LD_LIBRARY_PATH=$HOME/local/lib:$NVOICE_SHARE/lib:$LD_LIBRARY_PATH

# Shell
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# Completion
zstyle ':completion:*' menu select interactive
zstyle ':completion:*' list-colors "${LS_COLORS}"

setopt menu_complete

# Keybind
bindkey -e
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word


## For tmux
export TMUX_TMPDIR=$HOME/.tmux.d/tmp

## Anasconda
export PATH="$PATH:$HOME/anaconda3/bin:$HOME/anaconda/bin"
test -e ~/anaconda3/etc/profile.d/conda.sh && . ~/anaconda3/etc/profile.d/conda.sh


# For Theme
## powerlevel
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(user ssh anaconda)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
source $HOME/plugin/powerlevel9k/powerlevel9k.zsh-theme

## :
if [ -f $HOME/.local/bin/powerline-daemon ]; then
    $HOME/.local/bin/powerline-daemon -q
    . $HOME/anaconda3/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
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
source $HOME/.zsh.d/plugin/fast-syntax-highlighting/fast-syntax-highlighting.zsh

# For Peco
[ -f $HOME/.zsh.d/peco.zshrc ] && source $HOME/.zsh.d/peco.zshrc

# For autosuggestion
autosuggestions=$HOME/.zsh.d/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -e $autosuggestions ]; then
    source $autosuggestions
fi

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# # zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

alias ls="ls --color=auto"
alias vi="vim"