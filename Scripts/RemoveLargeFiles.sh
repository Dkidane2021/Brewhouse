#!/bin/bash
echo "Searching for files over 500MB in your home directory..."
find ~ -type f -size +500M -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
