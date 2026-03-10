#!/bin/bash

# Script: Git Repository Status and Update Tool
# Description: Shows detailed file information and performs git operations

echo "========================================="
echo "GIT REPOSITORY STATUS AND UPDATE TOOL"
echo "========================================="
echo

# Display current directory
echo "📍 Current directory: $(pwd)"
echo

# List all files with detailed information (including hidden files)
echo "📁 STEP 1: Listing all files (including hidden) in current directory..."
echo "----------------------------------------"
ls -alRSA
echo "----------------------------------------"
echo "✅ File listing complete"
echo

# Check git status
echo "📊 STEP 2: Checking git repository status..."
echo "----------------------------------------"
git status
echo "----------------------------------------"

# Check if we're in a git repository
if [ $? -ne 0 ]; then
    echo "⚠️  Warning: Not in a git repository or git not initialized"
    echo "Continuing with file listing only..."
else
    echo "✅ Git status check complete"
fi
echo

# List files again before adding
echo "📁 STEP 3: Re-listing files before git add..."
echo "----------------------------------------"
ls -alRSA
echo "----------------------------------------"
echo

# Add files to git
echo "➕ STEP 4: Adding files to git staging area..."
echo "----------------------------------------"
git add .
echo "----------------------------------------"

# Check if git add was successful
if [ $? -eq 0 ]; then
    echo "✅ Files added successfully to staging area"
else
    echo "❌ Error adding files to git"
fi
echo

# List files after adding
echo "📁 STEP 5: Final file listing..."
echo "----------------------------------------"
ls -alRSA
echo "----------------------------------------"
echo

# Check git status after adding
echo "📊 STEP 6: Checking updated git status..."
echo "----------------------------------------"
git status
echo "----------------------------------------"

# Final message
echo "🎉 STEP 7: Script execution completed!"
echo "========================================="
echo "script executed successfully at $(date)"
echo "========================================="