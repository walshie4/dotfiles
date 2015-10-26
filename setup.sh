#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
  sudo apt-get install python-pip python-dev
  sudo pip install psutil thefuck # install thefuck on Ubuntu
  brew install thefuck # install thefuck on OS X
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  ./update_pathogen.sh # install / update pathogen
  git clone https://github.com/junegunn/vim-easy-align ~/.vim/bundle/vim-easy-align # install pathogen plugins
  git clone https://github.com/ap/vim-css-color ~/.vim/bundle/vim-css-color
  git clone https://github.com/kchmck/vim-coffee-script ~/.vim/bundle/vim-coffee-script
  git clone https://github.com/wavded/vim-stylus ~/.vim/bundle/vim-stylus
  git clone https://github.com/Bling/vim-airline ~/.vim/bundle/vim-airline
  git clone https://github.com/tpope/vim-surround ~/.vim/bundle/vim-surround
  git clone https://github.com/mustache/mustache ~/.vim/bundle/mustache
  git clone https://github.com/vbundles/nerdtree ~/.vim/bundle/nerdtree
  git clone https://github.com/mattn/emmet-vim ~/.vim/bundle/emmet-vim
  git clone https://github.com/scrooloose/syntastic ~/.vim/bundle/syntastic
  git clone https://github.com/ervandew/supertab ~/.vim/bundle/supertab
  git clone https://github.com/tpope/Vim-fugitive ~/.vim/bundle/Vim-fugitive
  git clone https://github.com/godlygeek/tabular ~/.vim/bundle/tabular
  git clone https://github.com/vim-scripts/matchit.zip ~/.vim/bundle/matchit
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  ./update_pathogen.sh # install / update pathogen again to update plugins
  sudo chsh -s $(which zsh) $(whoami) # change shell to zsh

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

