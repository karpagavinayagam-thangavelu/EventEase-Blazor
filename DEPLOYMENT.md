# EventEase Deployment Guide

## Issue Fixed
**Problem**: `MainLayout.razor` was inheriting from `LayoutView` instead of `LayoutComponentBase`
**Solution**: Changed `@inherits LayoutView` to `@inherits LayoutComponentBase`

## Local Testing & Deployment

### Step 1: Test Build Locally
```bash
cd /home/karpagavinayagam/ai-projects/security-learn2/chashproject

# Restore dependencies
dotnet restore

# Build in Release mode
dotnet build --configuration Release

# Run locally to test
dotnet run
```

### Step 2: Test Publish
```bash
# Publish the application
dotnet publish -c Release -o ./publish

# Test the published version
cd publish
dotnet EventEase.dll
```

### Step 3: Initialize Git Repository (if not done)
```bash
cd /home/karpagavinayagam/ai-projects/security-learn2/chashproject

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Fix: MainLayout inheritance - changed from LayoutView to LayoutComponentBase"
```

### Step 4: Connect to GitHub
```bash
# Add remote (replace with your repository URL)
git remote add origin https://github.com/karpagavinayagam/EventEase-Blazor.git

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

### Step 5: Verify GitHub Actions
After pushing, GitHub Actions will automatically:
1. Restore dependencies
2. Build the project
3. Publish artifacts
4. Build Docker image

Check the Actions tab in your GitHub repository to monitor the build.

## Quick Deploy Script
```bash
#!/bin/bash
# Make this file executable: chmod +x quick-deploy.sh

cd /home/karpagavinayagam/ai-projects/security-learn2/chashproject

echo "🔧 Building..."
dotnet build -c Release || exit 1

echo "📦 Publishing..."
dotnet publish -c Release -o ./publish || exit 1

echo "📤 Committing and pushing to GitHub..."
git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

echo "✅ Deployment complete! Check GitHub Actions for build status."
```

## Docker Deployment
```bash
# Build Docker image
docker build -t eventeaseapp:latest .

# Run container
docker run -d -p 8080:80 --name eventeaseapp eventeaseapp:latest

# Test
curl http://localhost:8080

# Stop container
docker stop eventeaseapp
docker rm eventeaseapp
```

## Troubleshooting

### If build fails locally:
```bash
# Clean build artifacts
dotnet clean
rm -rf bin obj

# Restore and rebuild
dotnet restore
dotnet build
```

### If GitHub Actions fails:
1. Check the Actions tab for error logs
2. Verify .NET 8.0 SDK is specified in workflow
3. Ensure all files are committed and pushed

### If Docker build fails:
```bash
# Check Docker is running
docker --version

# View build logs
docker build -t eventeaseapp:latest . --progress=plain
```
