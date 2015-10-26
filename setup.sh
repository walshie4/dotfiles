#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
  sudo apt-get install python-pip python-dev
  sudo pip install psutil thefuck
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  ./update_pathogen.sh
  rsync --exclude ".git/" --exclude ".DS_Store" \
    --exclude "README.md" --exclude "LICENSE.txt" -avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;

