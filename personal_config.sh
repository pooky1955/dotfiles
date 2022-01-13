#>>> conda initialize >>>
#!! Contents within this block are managed by 'conda init' !!
load_conda(){
    __conda_setup="$('/home/james/programs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/james/miniconda3/etc/profile.d/conda.sh" ]; then
            #. "/home/james/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
            #export PATH="/home/james/miniconda3/bin:$PATH"  # commented out by conda initialize
        fi
    fi
    unset __conda_setup

}
 alias refresh_cache='load_conda && conda info --env | tail -n +3 | tee ~/.conda_envs.txt'
 alias ce='load_conda && conda activate $(cat ~/.conda_envs.txt | fzf | cut -d " " -f1)'
 #<<< conda initialize <<<


 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setup dircolors for nord colorscheme!
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# =========================================
# ========== Environment variables=========
# =========================================
export VISUAL=nvim
export EDITOR=$VISUAL

# =========================================
# ===========My PATH's variables===========
# =========================================

#golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go


# ==========================================
# ============My Aliases====================
# ==========================================

# renaming fd
alias bat=batcat
alias fd=fdfind
# fzf search
alias sf="fzf --preview='batcat --style=numbers --color=always --line-range :500 {}'"

alias sfh="fd --type f -H | sf"
alias sfi="fd --type f -I | sf"
alias sfhi="fd --type f -HI | sf"
alias sc="fd --type d | fzf"

# my little scripts
export PATH=$PATH:/home/james/scripts

#config folder
alias config='/usr/bin/git --git-dir=/home/james/.cfg/ --work-tree=/home/james'

# python alias
alias py=python3

# neovim
alias nv=nvim

#clipboard
alias c="xclip -selection clipboard"
alias v="xclip -o -selection clipboard"

#bat colored output
alias b="bat --style=numbers --color=always --line-range :500 "

#neovim with fzf
# for some reason when i use double quotes it executes the command on startup
alias e='nv -o `sf`' 
alias eh='nv -o `sfh`'
alias ei='nv -o `sfi`'
alias ehi='nv -o `sfhi`'
alias cz='cd ~ && cd $(fd -H -t d | fzf)'
alias nvc='nv `sc`'

#ytop
alias tiled='export QT_FONT_DPI=144 && ~/Downloads/Tiled-1.4.3-x86_64.AppImage'
alias ulogout="pkill -u ${USER}"
#cheatsheet
alias s="cht.sh"
alias snip='maim -s | xclip -selection clipboard -t image/png'

function pbl(){
    SOURCE=$2
    NAME=$1
    cd ~/Documents/cp-problems
    cookiecutter -sf --no-input cp-template question_id=$NAME question_source=$SOURCE
    QUESTION_PATH="./$SOURCE/q-$NAME"
    cd $QUESTION_PATH
}
# ============================================
# =============Startup scripts================
# ============================================
set -o vi
function je(){
    echo "Executing $1.java"
    # now time to get the rest of arguments
    args="${@:2}"
    javac -g $1.java && java $1 $args
}
# keybinds
bindkey -s '^e' 'nvim .^M'
#
# The next line enables shell command completion for gcloud.
load_nvm(){
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# opam configuration
test -r /home/james/.opam/opam-init/init.zsh && . /home/james/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$HOME/.poetry/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
