#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  unset ZSH
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  apt-get install python-pip python-dev
  pip install psutil thefuck # install thefuck on Ubuntu
  brew install thefuck # install thefuck on OS X
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  git clone git@github.com:junegunn/vim-easy-align.git  ~/.vim/bundle/vim-easy-align # install pathogen plugins
  git clone git@github.com:kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee-script
  git clone git@github.com:wavded/vim-stylus.git        ~/.vim/bundle/vim-stylus
  git clone git@github.com:Bling/vim-airline.git        ~/.vim/bundle/vim-airline
  git clone git@github.com:pangloss/vim-javascript.git  ~/.vim/bundle/vim-javascript
  git clone git@github.com:mxw/vim-jsx.git              ~/.vim/bundle/vim-jsx
  git clone git@github.com:mustache/mustache.git        ~/.vim/bundle/mustache
  git clone git@github.com:scrooloose/nerdtree.git      ~/.vim/bundle/nerdtree
  git clone git@github.com:tpope/Vim-fugitive.git       ~/.vim/bundle/Vim-fugitive
  git clone git@github.com:Yggdroot/indentLine.git      ~/.vim/bundle/indentLine
  git clone git@github.com:mtscout6/vim-cjsx.git        ~/.vim/bundle/vim-cjsx
  git clone --depth=1 git@github.com:vim-syntastic/syntastic.git ~/.vim/bundle/vim-syntastic
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  ./update_pathogen.sh # install / update pathogen again to update plugins
  chsh -s $(which zsh) $(whoami) # change shell to zsh

  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "setup.sh" \
    --exclude "README.md" --exclude "LICENSE.txt" \
    --exclude "update_pathogen.sh" --exclude "Makefile" -avh --no-perms . ~;
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
echo "If you are on OS X run 'sh .osx' to manipulate OS X setting as well"
