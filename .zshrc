# Path to your oh-my-zsh installation.
export ZSH=/Users/adamwalsh/.oh-my-zsh

ZSH_THEME="agnoster"

HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=1

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

setopt rmstarsilent
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt PROMPT_SUBST
setopt RM_STAR_WAIT
unsetopt beep
bindkey -v

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/adamwalsh/.rvm/gems/ruby-2.1.6@scripts/bin:/Users/adamwalsh/.rvm/gems/ruby-2.1.6@global/bin:/Users/adamwalsh/.rvm/rubies/ruby-2.1.6/bin:/Users/adamwalsh/.rvm/gems/ruby-2.1.6@npscripts/bin:/Users/adamwalsh/.rvm/bin:/Users/adamwalsh/depot_tools:/Users/adamwalsh/.rvm/bin:/Users/adamwalsh/depot_tools"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

eval $(thefuck --alias)
alias wallsane='~/Developer/wallsane/wallsane.sh -d ~/Backgrounds'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

##### OSX SPECIFIC OPTIONS ###################################################
if [[ $HOME == /Users/* ]]; then
  export LC_ALL=en_US.UTF-8
  alias ls='gls --color=auto'
  alias hn='open https://news.ycombinator.com'
  alias weather='open https://forecast.io'
  eval $(gdircolors -b ~/.dir_colors)
else
###### ARCH SPECIFIC OPTIONS ##################################################
    eval $(dircolors -b ~/.dir_colors)
    alias ls='ls --color=auto'
fi

RPROMPT='[%{$fg[grey]%}%W %*%{$reset_color%}]'
PROMPT='%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%~ %{$fg[cyan]%}{$(git_prompt_info)}%{$reset_color%} '
# on start commands
echo "-... .-. . .- - .... ." | fmt -c -w $COLUMNS
