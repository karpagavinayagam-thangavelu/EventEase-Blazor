#!/bin/bash

cd /home/karpagavinayagam/ai-projects/security-learn2/chashproject

echo "🔧 Building..."
dotnet build -c Release || { echo "❌ Build failed"; exit 1; }

echo "✅ Build successful!"

echo "📤 Pushing to GitHub..."
git add .
git commit -m "Fix: Add namespace to Error.cshtml"

# Get current branch name
BRANCH=$(git branch --show-current)
echo "Current branch: $BRANCH"

# Push to current branch
git push origin $BRANCH

echo "✅ Pushed to origin/$BRANCH"
echo "🔗 Check: https://github.com/karpagavinayagam-thangavelu/EventEase-Blazor/actions"
