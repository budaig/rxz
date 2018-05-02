#!/bin/bash

# Decrypt the private key
openssl aes-256-cbc -K $encrypted_0073154072eb_key -iv $encrypted_0073154072eb_iv -in .travis/4gcbdg.enc -out ~/.ssh/4gcbdg -d
# Set the permission of the key
chmod 600 ~/.ssh/4gcbdg
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/4gcbdg
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config

# Set Git config
git init
git config user.name "budaig"
git config user.email "brux@qq.com"
# Deploy to GitHub
hexo deploy
# hexo deploy --config source/_data/next.yml
rm -rf ~/.ssh