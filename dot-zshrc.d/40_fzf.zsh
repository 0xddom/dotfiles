
if fzf --zsh 2> /dev/null > /dev/null ; then
	eval "$(fzf --zsh)"
else
  if [ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completion.zsh" ] ; then
    mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"
    curl 'https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh' > "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completion.zsh"
  fi
  if [ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/key-bindings.zsh" ] ; then
    mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"
    curl 'https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh' > "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/key-bindings.zsh"
  fi
  source "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completion.zsh"
  source "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/key-bindings.zsh"
fi
