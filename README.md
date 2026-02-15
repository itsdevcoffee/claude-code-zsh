# Claude Code ZSH Completions

Comprehensive ZSH completions for the [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code).

## Features

- Complete coverage of all commands, subcommands, and their options
- Nested subcommand support up to 3 levels deep (`claude plugin marketplace add`)
- Context-aware value suggestions (scopes, transport types, models, formats)
- Easy installation with multiple methods
- Simple updates via `git pull`

## Installation

### Quick Install (Interactive)

```bash
git clone https://github.com/dev-coffee/claude-code-zsh.git
cd claude-code-zsh
./install.sh
```

### Oh My Zsh

```bash
git clone https://github.com/dev-coffee/claude-code-zsh.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh

# Add to plugins in ~/.zshrc
plugins=(... claude-code-zsh)

source ~/.zshrc
```

### Manual (fpath)

```bash
git clone https://github.com/dev-coffee/claude-code-zsh.git ~/.zsh/claude-code-zsh

# Add to ~/.zshrc
fpath=(~/.zsh/claude-code-zsh $fpath)
autoload -Uz compinit && compinit

source ~/.zshrc
```

### Antigen

```bash
antigen bundle dev-coffee/claude-code-zsh
```

### Zinit

```bash
zinit light dev-coffee/claude-code-zsh

# Or with lazy loading
zinit wait lucid for dev-coffee/claude-code-zsh
```

## Updating

```bash
cd /path/to/claude-code-zsh
git pull

# Clear completion cache and reload
rm -f ~/.zcompdump* && exec zsh
```

## What's Completed

### Commands & Subcommands

| Command | Subcommands | Options |
|---------|-------------|---------|
| `claude` | - | 40+ flags with value suggestions |
| `claude auth` | `login`, `logout`, `status` | `--email`, `--sso`, `--json`, `--text` |
| `claude doctor` | - | `--help` |
| `claude install` | target (`stable`, `latest`) | `--force` |
| `claude mcp` | `add`, `add-json`, `add-from-claude-desktop`, `get`, `list`, `remove`, `reset-project-choices`, `serve` | `--scope`, `--transport`, `--header`, `--env`, `--callback-port`, `--client-id`, `--client-secret`, `--debug`, `--verbose` |
| `claude plugin` | `install`/`i`, `enable`, `disable`, `uninstall`/`remove`, `update`, `list`, `validate`, `marketplace` | `--scope`, `--all`, `--json`, `--available` |
| `claude plugin marketplace` | `add`, `list`, `remove`/`rm`, `update` | `--json` |
| `claude setup-token` | - | `--help` |
| `claude update`/`upgrade` | - | `--help` |

### Value Completions

- **Models:** `sonnet`, `opus`, `haiku`
- **Effort levels:** `low`, `medium`, `high`
- **Output formats:** `text`, `json`, `stream-json`
- **Permission modes:** `acceptEdits`, `bypassPermissions`, `default`, `delegate`, `dontAsk`, `plan`
- **Scopes:** `local`, `user`, `project` (+ `managed` for plugin update)
- **Transport types:** `stdio`, `sse`, `http`
- **Install targets:** `stable`, `latest`

## Troubleshooting

### Completions not working

```bash
# Clear completion cache and reload
rm -f ~/.zcompdump* && exec zsh
```

### Verify installation

```bash
# Check fpath includes the completion directory
echo $fpath | tr ' ' '\n' | grep claude

# Check completion function is loaded
which _claude
```

### Still not working

Make sure ZSH completion system is enabled in `~/.zshrc`:

```bash
autoload -Uz compinit && compinit
```

## Contributing

1. Fork the repository
2. Edit `_claude` with your changes
3. Test locally (`rm -f ~/.zcompdump* && exec zsh`)
4. Submit a pull request

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

MIT
