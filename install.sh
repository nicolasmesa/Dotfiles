#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DIR/gitignore" ~/.gitignore
ln -sf "$DIR/.vim" ~/.vim
ln -sf "$DIR/.vimrc" ~/.vimrc
ln -sf "$DIR/.bash_functions" ~/.bash_functions

git config --global core.excludesfile ~/.gitignore

# Add sourcing to shell config (idempotent)
add_source_line() {
    local file="$1"
    local marker="# Source custom bash functions"

    if [ -f "$file" ] && ! grep -q "$marker" "$file"; then
        echo "" >> "$file"
        echo "$marker" >> "$file"
        echo 'if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi' >> "$file"
    fi
}

# Try bashrc first (Linux), then bash_profile (macOS)
if [ -f ~/.bashrc ]; then
    add_source_line ~/.bashrc
elif [ -f ~/.bash_profile ]; then
    add_source_line ~/.bash_profile
fi
