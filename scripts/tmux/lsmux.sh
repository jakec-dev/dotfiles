#!/usr/bin/env bash

# -- HOME DIR SESSION --
HOME_SESSION_NAME="home"
tmux has-session -t $HOME_SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
  tmux new-session -s $HOME_SESSION_NAME -d
fi
# 2. If doesn't exist then create (don't attach yet)

# -- PROJECT SESSION --
# 1. Get args
# 2. Import project map
# 3. Get project from map[arg[0]]
# 4. CD to project dir
# 5. Check for existing session
# 6. If exists then attach
# 7. If doesn't exist then create

# 8. Attach to session

# -- ENHANCEMENTS --
# - Use fzf autocomplete to find projects
# - Arg to open in landscape or portrait
#   - Or better yet, use monitor dimensions to determine landscape vs portrait
