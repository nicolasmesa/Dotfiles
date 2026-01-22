# Get short hash of current directory path (for disambiguation)
pwdhash() {
    echo -n "$PWD" | md5sum | cut -c1-6
}

# Create/attach tmux session named after current directory
tdefault() {
    local dir_name=$(basename "$PWD")
    local hash=$(pwdhash)
    local session_name="${dir_name}-${hash}"

    # Sanitize: replace invalid tmux session name chars
    session_name=$(echo "$session_name" | tr './:' '_')

    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -s "$session_name"
    fi
}
