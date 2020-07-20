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
bindkey -e

autoload colors
colors

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

alias vi="vim"

# For Cuda
export CUDA_HOME=/usr/local/cuda-9.0
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# For Theme
## powerlevel
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $HOME/.src/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
