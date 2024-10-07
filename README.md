# Configurations for a variety of software

- zsh
- neovim
- tmux

The `old` branch has configurations I don't use anymore.

## Setup

Install `git` and `stow` version 2.4.0 or greater. Depending on your operating system you may need to install `stow` manually.

```
git clone git@github.com:0xddom/dotfiles.git .dotfiles
cd .dotfiles
stow .
```

### Tmux

Install the Tmux Package Manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
