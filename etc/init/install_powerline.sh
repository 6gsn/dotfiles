#!/bin/bash

# requirement: git, pip, (patched font)
function check_requirement() {
    messages=()
    for r in "git" "pip"
    do
	[ -z `which $r` ] && messages+=($r)
    done
    if [ ${#messages[@]} -gt 0 ]
    then
	echo "NOT found: ${messages[@]}. Try again after installing the command(s)."
	exit 1;
    fi
}

[ ! -f ~/.local/bin/powerline ] && pip install --user powerline-status

if [ ! -d ~/.src/powerline ];
then
    mkdir -p ~/.src
    cd ~/.src/
    git clone https://github.com/powerline/powerline
    cd -
fi

if [ ! -d ~/.src/powerlevel10k ];
then
    mkdir -p ~/.src
    cd ~/.src/
    git clone --depth=1 https://github.com/romkatv/powerlevel10k
    cd -
fi

if [ ! -d ~/.src/fonts ];
then
    mkdir -p ~/.src
    cd ~/.src/
    git clone https://github.com/powerline/fonts
    cd -
fi

if [ ! -d ~/.src/nerd-fonts ];
then
    mkdir -p ~/.src
    cd ~/.src/
    git clone --depth=1 https://github.com/ryanoasis/nerd-fonts
    cd -
fi

cd ~/.src/powerline
git checkout 2.5.2
cd -

# Patched powerline fonts
cd ~/.src/fonts
./install.sh
cd -

# Patched nerd fonts
cd ~/.src/nerd-fonts
./install.sh
cd -
