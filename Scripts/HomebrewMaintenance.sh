#!/bin/bash
echo "Running Homebrew update & cleanup..."
brew update
brew upgrade
brew cleanup
brew doctor
echo "✅ Homebrew is updated and tidy."

