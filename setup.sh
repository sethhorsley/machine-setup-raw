#!/bin/bash

set -e  # Exit on any error

echo "🚀 Setting up development machine..."

# Install mise (modern runtime manager)
echo "📦 Installing mise..."
curl https://mise.run | sh

# Add mise to PATH
echo "🔧 Configuring mise..."
echo "eval \"\$(/root/.local/bin/mise activate bash)\"" >> ~/.bashrc
source ~/.bashrc

# Install Node.js 20 via mise
echo "📦 Installing Node.js 20..."
/root/.local/bin/mise use -g node@20

# Install Claude Code CLI
echo "🤖 Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

# Copy tmux configuration if it exists
if [ -f "/root/.tmux.conf" ]; then
    echo "📋 Copying tmux configuration..."
    cp /root/.tmux.conf ./tmux.conf
    echo "✅ tmux.conf saved to repo"
else
    echo "⚠️  No tmux configuration found at /root/.tmux.conf"
fi

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Run 'source ~/.bashrc' to reload your shell"
echo "2. Run 'claude' to start Claude Code"
echo "3. If you have the tmux.conf file, copy it to ~/.tmux.conf"