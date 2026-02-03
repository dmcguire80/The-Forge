#!/bin/bash

# The Forge - Project Setup Script
# Installs The Forge agents and skills into your project

set -e

echo "🔨 The Forge - Project Setup"
echo "=============================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FORGE_DIR="$(dirname "$SCRIPT_DIR")"

# Check if we're in a project directory
if [ ! -f "package.json" ] && [ ! -f "pyproject.toml" ] && [ ! -f "Cargo.toml" ]; then
    echo "⚠️  Warning: No package.json, pyproject.toml, or Cargo.toml found."
    echo "   Are you in a project directory?"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create .agent directory
echo "📁 Creating .agent directory..."
mkdir -p .agent

# Copy agents
echo "🤖 Installing agents..."
cp -r "$FORGE_DIR/agents" .agent/
echo "   ✓ Installed $(ls .agent/agents | wc -l | tr -d ' ') agents"

# Copy skills
echo "📚 Installing skills..."
cp -r "$FORGE_DIR/skills" .agent/
echo "   ✓ Installed $(ls .agent/skills | wc -l | tr -d ' ') skills"

# Copy docs (optional)
read -p "📖 Install documentation? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p .agent/docs
    cp -r "$FORGE_DIR/docs/"* .agent/docs/
    echo "   ✓ Installed documentation"
fi

echo ""
echo "✅ The Forge installed successfully!"
echo ""
echo "📋 What's installed:"
echo "   • Agents: .agent/agents/"
echo "   • Skills: .agent/skills/"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "   • Docs: .agent/docs/"
fi
echo ""
echo "🚀 Next steps:"
echo "   1. Try: 'Use the team-lead agent to review the codebase'"
echo "   2. Read: .agent/docs/getting-started.md"
echo "   3. Explore: .agent/docs/agent-hierarchy.md"
echo ""
echo "🔨 Happy forging!"
