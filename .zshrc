#!/usr/bin/env zsh

# Sane defaults.
# TODO Add these in.

# Check if we're using oh my zsh or zprezto
if [[ -d ~/.oh-my-zsh ]]; then
    source ~/.zshrc_ohmyzsh
elif [[ -d ~/.zprezto ]]; then
    # Do the usual zprezto source things.
fi
