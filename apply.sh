#!/bin/bash

# Tool dependencies
DEPS="curl stow git fc-cache"
for dep in $DEPS; do
  echo $dep 
  if ! which $dep > /dev/null 2>&1 ; then 
    echo "Missing dependency: $dep"
    exit 1
  fi
done

# Link the config files in this repo
echo "Linking config files with stow"
stow -t $HOME . 

# Apply the global gitignore configuration
IGNORE_FILE="$(pwd)/global-gitignore"
GITCONFIG=$HOME/.gitconfig
if ! grep $IGNORE_FILE $GITCONFIG > /dev/null 2>&1; then
  echo "Configuring git"
  git config --global core.excludesfile "$(pwd)/global-gitignore"
else 
  echo "No git configuration applied"
fi

# Download and install nerd fonts
FONT="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.tar.xz"
FONT_DIR="$HOME/.local/share/fonts/Source Code Pro"
if [ $(uname) = 'Linux' ] && ! [ -e "$FONT_DIR" ]; then
  tmp=$(mktemp)
  curl -L "$FONT" > $tmp 
  mkdir -p "$FONT_DIR"
  pushd "$FONT_DIR" 
  tar -xf $tmp 
  popd
  fc-cache -v
fi
