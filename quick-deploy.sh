#!/bin/bash

cd /home/karpagavinayagam/ai-projects/security-learn2/chashproject

echo "🔧 Building..."
dotnet build -c Release || { echo "❌ Build failed"; exit 1; }

echo "📦 Publishing..."
dotnet publish -c Release -o ./publish || { echo "❌ Publish failed"; exit 1; }

echo "📤 Committing and pushing to GitHub..."
git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

echo "✅ Deployment complete! Check GitHub Actions for build status."
echo "🔗 https://github.com/karpagavinayagam/EventEase-Blazor/actions"
