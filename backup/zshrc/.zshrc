# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.bash_scripts" # Exports all my favorite bash scripts

PROMPT='%F{green}%n@%m %F{blue}%~ %f%# '

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="random"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Assembly Functions
# Build and Run Assembly Files
alias assemble='function _assemble() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: assemble <asm_file>"
        return 1
    fi

    local asm_file="$1"
    local obj_file="${asm_file%.asm}.o"
    local exe_file="${asm_file%.asm}"

    nasm -felf64 "$asm_file" && ld "$obj_file" -o "$exe_file" && "./$exe_file"
}; _assemble'

# Destroy Assembly .o files and executables based on the .asm file
alias unassemble='function _unassemble() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: unassemble <asm_file>"
        return 1
    fi

    local asm_file="$1"
    local obj_file="${asm_file%.asm}.o"
    local exe_file="${asm_file%.asm}"

    if [[ -f "$obj_file" ]]; then
        rm "$obj_file"
        echo "Removed $obj_file"
    else
        echo "$obj_file does not exist"
    fi

    if [[ -f "$exe_file" ]]; then
        rm "$exe_file"
        echo "Removed $exe_file"
    else
        echo "$exe_file does not exist"
    fi
}; _unassemble'

alias python=/usr/bin/python3
alias lg='lazygit'
alias ls='ls -l --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
# alias spt='~/.bash_scripts/spt.sh'
# alias update='~/.bash_scripts/update-all.sh'
# alias pb='~/.bash_scripts/toggle_polybar.sh'
alias clc='clear'
alias ff='fastfetch'

__conda_setup="$('/home/jazz/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jazz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jazz/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jazz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
plugins=(git zsh-history-substring-search zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -v

# Custom key bindings for vi command mode
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line

# Bind Ctrl+Space to accept the autosuggestion
bindkey '^ ' autosuggest-accept
