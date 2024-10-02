# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="duellj"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=( 
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# # Hide welcome message
unsetopt PROMPT_SP

# Ensure Zsh is being reported as the shell
export SHELL="/usr/bin/zsh"

# Set values for Virtual Environments
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Set MANPAGER and MANROFFOPT for reading man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Source profile setup, if needed
if [ -f ~/.zsh_profile ]; then
source ~/.zsh_profile
fi

# Add ~/.local/bin to PATH
if [ -d ~/.local/bin ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Add depot_tools to PATH
if [ -d ~/Applications/depot_tools ]; then
  export PATH="$HOME/Applications/depot_tools:$PATH"
fi


# Starship prompt initialization
#if [[ $- == *i* ]]; then
#  eval "$(starship init zsh)"
#fi

# Replicating Fish's !! and !$ functions
function __history_previous_command() {

BUFFER=${history[-1]}# Enable timestamp in history

  zle end-of-line
}

function __history_previous_command_arguments() {
  BUFFER=$BUFFER' !$'
  zle end-of-line
}

zle -N __history_previous_command
zle -N __history_previous_command_arguments

# bindekey '!' __history_previous_command
# bindkey '$' __history_previous_command_arguments

# Enable timestamp in history
HIST_STAMPS="yyyy-mm-dd"

# Aliases
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias l.='eza -ald --color=always --group-directories-first --icons .*'
alias cat='bat --style header --style snip --style changes --style header'

# Conditional alias for yay/paru
if ! command -v yay &> /dev/null && command -v paru &> /dev/null; then
  alias yay='paru'
fi

# Common Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias big='expac -H M "%m\t%n" | sort -h | nl'
alias dir='dir --color=auto'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias grep='ugrep --color=auto'
alias grubup='sudo update-grub'
alias hw='hwinfo --short'
alias ip='ip -color'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias rmpkg='sudo pacman -Rdd'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias upd='/usr/bin/garuda-update'
alias wget='wget -c'

# Mirrors and reflector aliases
alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Help and shortcuts
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias helpme='echo "To print basic information about a command use tldr <command>"'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias jctl='journalctl -p 3 -xb'
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

# Backup function
backup() {
  cp "$1" "$1.bak"
}

# Copy function
copy() {
  if [ -d "$1" ]; then
    cp -r "$1" "$2"
  else
    cp "$@"
  fi
}

# Cleanup orphaned packages
cleanup() {
  while pacman -Qdtq; do
    sudo pacman -R $(pacman -Qdtq)
  done
}


# Run fastfetch or neofetch on shell startup if available
if [ -n "$PS1" ] && command -v fastfetch &> /dev/null; then
  fastfetch --config neofetch.jsonc
fi

