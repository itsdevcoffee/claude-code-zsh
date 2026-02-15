# Claude Code ZSH Completions

_Tab-complete every Claude Code command, subcommand, flag, and value — right from your terminal._

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Zsh: 5.0+](https://img.shields.io/badge/Zsh-5.0%2B-blue.svg)](https://www.zsh.org/)
[![GitHub stars](https://img.shields.io/github/stars/itsdevcoffee/claude-code-zsh)](https://github.com/itsdevcoffee/claude-code-zsh/stargazers)
[![GitHub last commit](https://img.shields.io/github/last-commit/itsdevcoffee/claude-code-zsh)](https://github.com/itsdevcoffee/claude-code-zsh/commits/main)

![Demo](demo.gif)

## Why?

The Claude Code CLI has 40+ flags and deep subcommand hierarchies (`claude plugin marketplace add`, `claude mcp add --scope --transport`). Remembering every flag and value is tedious. This plugin gives you instant tab completion for every command, option, and value — making the CLI feel native to your shell.

## Features

- **Full command coverage** — 40+ flags, all subcommands up to 3 levels deep
- **Context-aware values** — models, permission modes, output formats, scopes, transport types
- **Works everywhere** — Oh My Zsh, Zinit, Antigen, zplug, or plain fpath
- **Zero dependencies** — pure ZSH completion, no external tools required
- **Easy updates** — just `git pull`

## Requirements

- Zsh 5.0+
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed

## Quick Start

```bash
git clone --depth 1 https://github.com/itsdevcoffee/claude-code-zsh.git ~/.zsh/claude-code-zsh
echo 'fpath=(~/.zsh/claude-code-zsh $fpath)' >> ~/.zshrc
exec zsh
```

Type `claude <Tab>` to verify it's working.

## Installation

### Oh My Zsh

```bash
git clone --depth 1 https://github.com/itsdevcoffee/claude-code-zsh.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh
```

Add `claude-code-zsh` to your plugins array in `~/.zshrc`:

```zsh
plugins=(... claude-code-zsh)
```

Reload: `exec zsh`

### Manual / Plain ZSH (fpath)

```bash
git clone --depth 1 https://github.com/itsdevcoffee/claude-code-zsh.git ~/.zsh/claude-code-zsh
```

Add to your `~/.zshrc`:

```zsh
fpath=(~/.zsh/claude-code-zsh $fpath)
```

> If you don't already have `autoload -Uz compinit && compinit` in your `.zshrc`, add it after the `fpath` line.

Reload: `exec zsh`

### Antigen

```bash
antigen bundle itsdevcoffee/claude-code-zsh
```

### Zinit

```bash
zinit light itsdevcoffee/claude-code-zsh

# Or with lazy loading
zinit wait lucid for itsdevcoffee/claude-code-zsh
```

### zplug

```bash
zplug "itsdevcoffee/claude-code-zsh"
```

## Usage

After installation, type `claude` and press `Tab` to see available subcommands. Completions work at every level:

```
claude <Tab>              # top-level commands and flags
claude mcp <Tab>          # mcp subcommands
claude mcp add -<Tab>     # flags for mcp add (--scope, --transport, etc.)
claude --model <Tab>      # value suggestions (sonnet, opus, haiku)
claude --effort <Tab>     # value suggestions (low, medium, high)
```

## Updating

```bash
# Navigate to install directory and pull
cd ~/.zsh/claude-code-zsh  # or ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh for Oh My Zsh
git pull

# Clear completion cache and reload
rm -f ~/.zcompdump* && exec zsh
```

## Supported Commands

### Commands & Subcommands

| Command | Subcommands | Per-Subcommand Options |
|---------|-------------|------------------------|
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

Make sure the ZSH completion system is enabled in `~/.zshrc`:

```bash
autoload -Uz compinit && compinit
```

## Uninstallation

**For Oh My Zsh:**

```bash
# Remove from plugins array in ~/.zshrc:
# plugins=(... claude-code-zsh)  # <- Delete this entry

# Remove directory
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh

exec zsh
```

**For manual install:**

```bash
# Remove this line from ~/.zshrc:
# fpath=(~/.zsh/claude-code-zsh $fpath)

# Remove directory
rm -rf ~/.zsh/claude-code-zsh

exec zsh
```

## FAQ

**Q: Do I need to update this when Claude Code updates?**
A: Yes, if new commands/flags are added. Just run `git pull` in the install directory and reload your shell.

**Q: Does this slow down my shell startup?**
A: No, ZSH loads completions lazily (only when you press Tab).

**Q: Can I customize which completions appear?**
A: ZSH completion system is highly customizable. See [ZSH completion documentation](https://zsh.sourceforge.io/Doc/Release/Completion-System.html) for advanced configuration.

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines and testing instructions.

Quick contribution workflow:

1. Fork the repository
2. Edit `_claude` with your changes
3. Test locally: `rm -f ~/.zcompdump* && exec zsh`
4. Submit a pull request

## License

[MIT](LICENSE)
