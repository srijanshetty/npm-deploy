#!/bin/bash -e

# Log actions with datestamp
log() {
    echo " [ $(date -R) ] $@"
}

# Check if we are in a git directory
if git rev-parse --git-dir &> /dev/null ; then
    log "In a git repo"
else
    echo "Not a git repo"
    exit 1
fi

# SSH to remote and create a bare repo and copy hooks
log "Creating new bare bones repository"
ssh "$1" "if [ -e $2 ]; then rm -rf $2; fi; git init --bare $2"

# Install post-receive hook
log "Installing post-receive hook"
scp hooks/post-receive "$1:$2/hooks/"
