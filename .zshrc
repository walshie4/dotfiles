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
autoload -U compinit
compinit
setopt completeinword
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
autoload select-word-style
select-word-style shell
# colors for ls
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

alias la='ls -a'

# superglobs
setopt extendedglob
unsetopt caseglob

setopt interactivecomments # pound sign in interactive prompt

setopt auto_cd

REPORTTIME=10

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/adamwalsh/.rvm/gems/ruby-2.1.6@scripts/bin:/Users/adamwalsh/.rvm/gems/ruby-2.1.6@global/bin:/Users/adamwalsh/.rvm/rubies/ruby-2.1.6/bin:/Users/adamwalsh/.rvm/gems/ruby-2.1.6@npscripts/bin:/Users/adamwalsh/.rvm/bin:/Users/adamwalsh/depot_tools:/Users/adamwalsh/.rvm/bin:/Users/adamwalsh/depot_tools"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PATH=$PATH:/Users/adamwalsh/Developer/depot_tools
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export ANDROID_HOME=/usr/local/opt/android-sdk

export EDITOR=vim

# Compilation flags
export ARCHFLAGS="-arch x86_64"

eval $(thefuck --alias)
alias wallsane='~/Developer/wallsane/wallsane.sh -d ~/Backgrounds'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias glom='git pull origin master'
alias note='node ~/Developer/notebook/index.js'
alias notes='node ~/Developer/notebook/index.js -l'
alias p='~/bin/p'
alias tmux='tmux -u'

##### OSX SPECIFIC OPTIONS ###################################################
if [[ $HOME == /Users/* ]]; then
  export LC_ALL=en_US.UTF-8
  eval $(gdircolors -b ~/.dir_colors)
else
###### ARCH SPECIFIC OPTIONS ##################################################
    eval $(dircolors -b ~/.dir_colors)
    alias ls='ls --color=auto'
fi

# Time on the right
RPROMPT='[%{$fg[grey]%}%W %*%{$reset_color%}]'
# PROMPT='%{$fg[red]%}%(1j.%j .)%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%~ %{$fg[cyan]%}{$(git_prompt_info)}%{$reset_color%} '
# on start commands
echo "use 'note to save a note"
echo "use 'notes' to see your notes"
echo "-... .-. . .- - .... ." | fmt -c -w $COLUMNS

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/adamwalsh/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/adamwalsh/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/adamwalsh/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/adamwalsh/google-cloud-sdk/completion.zsh.inc'
fi

source '/Users/adamwalsh/.honeynpmrc'

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# Use this to have a different animal say a message in the big box.
export TTC_SAY_BOX="cat"

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/Developer,~/Honey'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.

export TTC_REPOS_DEPTH=2

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Los Angeles, CA'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Twitter api keys
export TTC_CONSUMER_KEY='NmdDjNMncjMXLAJyyAtP49Glg'
export TTC_CONSUMER_SECRET='jOXfyLsF5DSiiqRu2Dmbr6cPmwwMTvUoFVp4CTsJlZxuRbDYtc'
export TTC_ACCESS_TOKEN='920114426-Td3oYUIqhTcLGRYwFGqP2DeppuwyHgYHNWhUT66g'
export TTC_ACCESS_TOKEN_SECRET='TkQzFSa5VOCbBG6mAlCEBjO1rV6r1AQ5fxesxrbxyqXVO'

# Antigen
source /Users/adamwalsh/Developer/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle npm
antigen bundle cp
antigen bundle docker
antigen bundle ddollar/git-utils
antigen bundle zsh-users/zsh-completions
antigen bundle dbkaplun/smart-cd
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle alexrochas/zsh-git-semantic-commits

antigen theme simple

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fin.
antigen apply

# transfer.io
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias branchrm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

autoload -U compinit && compinit
zmodload -i zsh/complist

. /Users/adamwalsh/Developer/z/z.sh

export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
