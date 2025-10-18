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
source ~/.bashrc

# Install Claude Code CLI
echo "🤖 Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

# Install tmux configuration
echo "📋 Installing tmux configuration..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/tmux.conf" ]; then
    # If tmux.conf exists locally (e.g., running from cloned repo)
    cp "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf
    echo "✅ tmux configuration installed to ~/.tmux.conf"
else
    # If running from curl, download from GitHub
    echo "Downloading tmux.conf from GitHub..."
    curl -fsSL https://raw.githubusercontent.com/sethhorsley/machine-setup-raw/main/tmux.conf -o ~/.tmux.conf
    echo "✅ tmux configuration downloaded and installed to ~/.tmux.conf"
fi

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Run 'source ~/.bashrc' to reload your shell"
echo "2. Run 'claude' to start Claude Code"
echo "3. Run 'tmux' to start a tmux session with the configured settings"
