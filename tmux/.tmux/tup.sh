#!/bin/bash
#
# Attach or create tmux session named the same as current directory.
#
# When called in a directory tup.sh will
# attach or create a new session with 5 windows and select first window
# 

PATH_NAME="$(basename "$PWD" | tr . -)";

# Set Session Name
SESSION=$PATH_NAME;
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION);

not_in_tmux() {
   [ -z "$TMUX" ]
}


echo "starting";

# Only run script if not in Tmux session
if not_in_tmux 
then
  # Only create tmux session if it doesn't already exist
  if [ "$SESSIONEXISTS" = "" ]
  then
      # Start New Session with our directory name
      tmux new-session -d -s $SESSION;

      # Name first Pane and start NeoVim
      tmux rename-window -t 1 'Code';
      tmux send-keys -t 'Code' 'nvim .' C-m;

      # Create and setup pane for shell
      tmux new-window -t $SESSION:2 -n 'Shell';
      # tmux split-pane -v -p 30
      tmux split-window -v
      tmux split-pane -h
  fi

  # Attach Session, on the Code window
  tmux attach-session -t $SESSION:1;
else
  # we are in a Tmux session
  printf "\n**************************************\n"
  printf "* You are already in a TMUX Session! *"
  printf "\n**************************************\n"
fi
