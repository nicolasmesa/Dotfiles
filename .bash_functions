# Get directory name with short hash for uniqueness (e.g., myproject-a3f2c1)
pwdhash() {
    local dir_name=$(basename "$PWD")
    local hash=$(echo -n "$PWD" | md5sum | cut -c1-6)
    echo "${dir_name}-${hash}"
}

# Create/attach tmux session named after current directory
tdefault() {
    # Sanitize: replace invalid tmux session name chars
    local session_name=$(pwdhash | tr './:' '_')

    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -s "$session_name"
    fi
}
