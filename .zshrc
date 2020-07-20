# PATH
export HOME=/Users/JP25632
export PATH=$HOME/local/bin:$HOME/bin:/usr/bin:/usr/local/bin:$HOME/.local/bin:$PATH

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

## Anasconda
export PATH="$PATH:/anaconda3/bin:/anaconda/bin"
test -e /anaconda3/etc/profile.d/conda.sh && . /anaconda3/etc/profile.d/conda.sh

## :
if [ -f $HOME/.local/bin/powerline-daemon ]; then
    $HOME/.local/bin/powerline-daemon -q
    . $HOME/.src/powerline/powerline/bindings/zsh/powerline.zsh
fi

# For Theme


# For highlight
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
## powerlevel
source $HOME/.src/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.zsh.d/.p10k.zsh ]] || source ~/.zsh.d/.p10k.zsh