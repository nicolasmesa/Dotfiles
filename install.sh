#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DIR/gitignore" ~/.gitignore
git config --global core.excludesfile ~/.gitignore
