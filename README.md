# Claude Code ZSH Completions

_Tab-complete every Claude Code command, subcommand, flag, and value — right from your terminal._

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Zsh: 5.0+](https://img.shields.io/badge/Zsh-5.0%2B-blue.svg)](https://www.zsh.org/)
[![GitHub stars](https://img.shields.io/github/stars/itsdevcoffee/claude-code-zsh)](https://github.com/itsdevcoffee/claude-code-zsh/stargazers)
[![GitHub last commit](https://img.shields.io/github/last-commit/itsdevcoffee/claude-code-zsh)](https://github.com/itsdevcoffee/claude-code-zsh/commits/main)

<!-- TODO: Add a demo GIF here recorded with vhs or asciinema -->

## Features

- **Full command coverage** — 40+ flags, all subcommands up to 3 levels deep
- **Context-aware values** — models, permission modes, output formats, scopes, transport types
- **Works everywhere** — Oh My Zsh, Zinit, Antigen, zplug, or plain fpath
- **Zero dependencies** — pure ZSH completion, no external tools required
- **Easy updates** — just `git pull`

## Requirements

- Zsh 5.0+
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed

## Installation

### Quick Install

```bash
git clone --depth 1 https://github.com/itsdevcoffee/claude-code-zsh.git ~/.zsh/claude-code-zsh
```

Add to your `~/.zshrc`:

```zsh
fpath=(~/.zsh/claude-code-zsh $fpath)
```

Then reload: `exec zsh`

> If you don't already have `autoload -Uz compinit && compinit` in your `.zshrc`, add it after the `fpath` line.

### Oh My Zsh

```bash
git clone --depth 1 https://github.com/itsdevcoffee/claude-code-zsh.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh
```

Add `claude-code-zsh` to your plugins in `~/.zshrc`:

```zsh
plugins=(... claude-code-zsh)
```

Then reload: `exec zsh`

### Manual (fpath)

```bash
git clone --depth 1 https://github.com/itsdevcoffee/claude-code-zsh.git ~/.zsh/claude-code-zsh
```

Add to your `~/.zshrc`:

```zsh
fpath=(~/.zsh/claude-code-zsh $fpath)
autoload -Uz compinit && compinit
```

Then reload: `exec zsh`

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
git -C ~/.zsh/claude-code-zsh pull

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

Remove the cloned directory and the plugin reference from `~/.zshrc`, then reload:

```bash
exec zsh
```

## Contributing

1. Fork the repository
2. Edit `_claude` with your changes
3. Test locally (`rm -f ~/.zcompdump* && exec zsh`)
4. Submit a pull request

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

[MIT](LICENSE)
