#!/bin/bash
echo "Cleaning system logs..."
sudo rm -rf /private/var/log/*
rm -rf ~/Library/Logs/*
echo "✅ Logs cleaned."
