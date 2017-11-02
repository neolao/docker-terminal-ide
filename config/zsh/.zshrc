# Default editor
export EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bira"
#ZSH_THEME="neolao"
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="mh"

# Theme customization
# @see https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'


# Locale
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ant colorize cp history history-substring-search node themes vim-interaction autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# nvm
if [ -f ~/.nvm/nvm.sh ]
then
    source ~/.nvm/nvm.sh
fi

# Default directory
cd /workspace

# LOGO
#cat ~/logo_terminal.txt
echo "[48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;179m  [48;5;179m  [48;5;179m  [48;5;179m  [48;5;179m  [48;5;179m  [48;5;179m  [48;5;179m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;179m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;179m  [48;5;179m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;179m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;179m  [48;5;179m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;179m  [48;5;231m  [48;5;231m  [48;5;179m  [48;5;231m  [48;5;231m  [48;5;179m  [48;5;179m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;37m  [48;5;231m  [48;5;231m  [48;5;37m  [48;5;231m  [48;5;231m  [48;5;37m  [48;5;37m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;37m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;37m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;37m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;16m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;231m  [48;5;16m  [0;m"
echo "[48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [48;5;16m  [0;m"


#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
