#!/usr/bin/env bash
set -e

# Name of the tmux session
SESSION="virtualteam"
# Load environment variables from .env if present
if [ -f .env ]; then
  set -o allexport
  source .env
  set +o allexport
fi


# Install tmux if it isn't already installed
if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux not found; installing..."
  sudo apt-get update
  sudo apt-get install -y tmux
fi

# Start a new tmux session in detached mode if one doesn't exist
if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux new-session -d -s "$SESSION"
fi

# Send commands to the tmux session
tmux send-keys -t "$SESSION" "cd /workspaces/arbitrage-app" C-m
#tmux send-keys -t "$SESSION" "echo 'Starting virtual team...'" C-m
tmux send-keys -t "$SESSION" "python3 run_team.py" C-m


# Attach to the tmux session so you can watch it run
tmux attach -t "$SESSION"
