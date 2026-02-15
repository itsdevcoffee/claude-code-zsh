# Testing Guide

## Manual Testing Steps

### 1. Basic Installation Test

```bash
# Clone repo
cd /tmp
git clone /home/maskkiller/dev-coffee/repos/claude-code-zsh test-claude-zsh
cd test-claude-zsh

# Run installer
./install.sh
# Choose option 2 (Manual)
```

### 2. Verify Installation

```bash
# Check fpath
echo $fpath | grep completions

# Check completion loaded
which _claude

# Should output the function location
```

### 3. Test Completions

Open a new terminal and test:

```bash
# Main command
claude <TAB>
# Should show: auth, doctor, install, mcp, plugin, setup-token, update, upgrade

# Main options
claude --<TAB>
# Should show all flags like --model, --effort, etc.

# Auth subcommand
claude auth <TAB>
# Should show: login, logout, status, help

# MCP subcommand
claude mcp <TAB>
# Should show: add, add-from-claude-desktop, add-json, get, list, remove, etc.

# Plugin marketplace
claude plugin marketplace <TAB>
# Should show: add, list, remove, rm, update, help

# Model options
claude --model <TAB>
# Should show: sonnet, opus, haiku

# Effort levels
claude --effort <TAB>
# Should show: low, medium, high

# Permission modes
claude --permission-mode <TAB>
# Should show: acceptEdits, bypassPermissions, default, delegate, dontAsk, plan

# Output formats
claude --output-format <TAB>
# Should show: text, json, stream-json
```

### 4. Test Update Process

```bash
# Make a trivial change
cd /path/to/claude-code-zsh
echo "# test" >> README.md
git add . && git commit -m "test"

# Pull (simulated update)
git pull

# Clear cache and reload
rm -f ~/.zcompdump*
exec zsh

# Verify completions still work
claude <TAB>
```

## Oh My Zsh Testing

```bash
# Install as Oh My Zsh plugin
git clone /home/maskkiller/dev-coffee/repos/claude-code-zsh \
  ~/.oh-my-zsh/custom/plugins/claude-code-zsh

# Add to ~/.zshrc plugins
# plugins=(... claude-code-zsh)

# Reload
source ~/.zshrc

# Test completions
claude <TAB>
```

## Expected Results

All completion tests should:
- Show relevant options immediately
- Include descriptions where applicable
- Support nested subcommands (up to 3 levels deep)
- Work after cache clear and shell reload
- Update seamlessly with git pull

## Common Issues

### Completions not appearing
```bash
# Solution: Clear cache
rm -f ~/.zcompdump*
exec zsh
```

### Duplicate completions
```bash
# Solution: Check for conflicting installations
echo $fpath | grep claude
# Should only show one path
```

### Slow completions
```bash
# Solution: Rebuild completion cache
rm -f ~/.zcompdump*
autoload -Uz compinit && compinit -C
```

## Automated Testing (Future)

Consider adding:
- ZSH completion testing framework
- CI/CD for validation
- Regression tests for new CLI versions
