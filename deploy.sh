#!/bin/bash

echo "EventEase Deployment Script"
echo "=========================="

# Build the application
echo "Building application..."
dotnet build -c Release

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    exit 1
fi

# Publish the application
echo "Publishing application..."
dotnet publish -c Release -o ./publish

if [ $? -eq 0 ]; then
    echo "✅ Publish successful"
    echo "📁 Published files are in ./publish directory"
else
    echo "❌ Publish failed"
    exit 1
fi

echo "🚀 Deployment ready!"
echo "To run: cd publish && dotnet EventEase.dll"