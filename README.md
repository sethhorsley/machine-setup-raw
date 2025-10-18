# Machine Setup

Automated setup script for a development machine with Claude Code and tmux configuration.

## What this sets up

- **mise**: Modern runtime manager for managing development tools
- **Node.js 20**: Latest LTS version via mise
- **Claude Code CLI**: Anthropic's official Claude CLI tool
- **tmux configuration**: Mobile-friendly tmux setup with emoji session names

## Quick Start

### One-line install

```bash
curl -fsSL https://raw.githubusercontent.com/sethhorsley/machine-setup-raw/main/setup.sh | bash
```

### Manual install

```bash
# Clone this repo
git clone <your-repo-url>
cd machine-setup

# Run the setup script
./setup.sh

# Reload your shell
source ~/.bashrc

# Copy tmux config (if you want the mobile-friendly setup)
cp tmux.conf ~/.tmux.conf
```

## Manual Setup

If you prefer to run commands manually:

```bash
# Install mise
curl https://mise.run | sh
echo "eval \"\$(/root/.local/bin/mise activate bash)\"" >> ~/.bashrc
source ~/.bashrc

# Install Node.js and Claude Code
mise use -g node@20
npm install -g @anthropic-ai/claude-code

# Setup tmux config
cp tmux.conf ~/.tmux.conf
```

## Features

### tmux Configuration
- Mobile-friendly status bar with responsive design
- Catppuccin color scheme
- Phone emoji session names (📱)
- Vim-like keybindings
- Mouse support enabled

### Development Tools
- mise for version management
- Node.js 20 LTS
- Claude Code CLI for AI-assisted development

## Usage

After setup:
- Run `claude` to start Claude Code
- Run `tmux` to start a session (automatically named 📱)
- Use `tmux attach` to reconnect to existing sessions