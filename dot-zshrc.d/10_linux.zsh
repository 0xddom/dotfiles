
if [ $(uname) = 'Linux' ]; then
  # Exports
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

  # Expand $PATH to include the directory where snappy applications go.
  snap_bin_path="/snap/bin"
  if [ -n "${PATH##*${snap_bin_path}}" ] && [ -n "${PATH##*${snap_bin_path}:*}" ]; then
    export PATH="$PATH:${snap_bin_path}"
  fi

fi
