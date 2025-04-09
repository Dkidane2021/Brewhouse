#!/bin/bash

echo "Starting macOS Disk Cleanup..."

# Delete system logs
echo "Clearing system logs..."
sudo rm -rf /private/var/log/*

# Delete temporary system files
echo "Removing temporary files..."
sudo rm -rf /private/var/tmp/*

# Clear user cache
echo "Clearing user cache..."
rm -rf ~/Library/Caches/*

# Clear Safari, Chrome, and Firefox browser cache
echo "Clearing browser cache..."
rm -rf ~/Library/Caches/com.apple.Safari/*
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Cache/*
rm -rf ~/Library/Caches/Mozilla/Firefox/*

# Remove orphaned Homebrew packages
if command -v brew &> /dev/null; then
    echo "Cleaning up Homebrew..."
    brew cleanup
fi

# Find and prompt to delete large files (over 1GB)
echo "Searching for large files (over 1GB)..."
find ~/ -type f -size +1G 2>/dev/null | tee /tmp/large_files.txt

echo "Do you want to delete these large files? (y/n)"
read -r choice
if [ "$choice" = "y" ]; then
    xargs rm < /tmp/large_files.txt
    echo "Large files deleted."
else
    echo "Large files not deleted."
fi

# Remove empty directories
echo " Removing empty directories..."
find ~/ -type d -empty -delete

echo " Cleanup Complete! Your Mac should have more free space now."

