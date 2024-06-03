#!/bin/bash

# Link the config files in this repo
stow .

# Apply the global gitignore configuration
git config --global core.excludesfile "$(pwd)/global-gitignore"
