# Contributing to Claude Code ZSH Completions

Thanks for your interest in contributing!

## How to Contribute

### Reporting Issues

If you find missing completions or bugs:

1. Check existing issues first
2. Provide specific examples of what's not working
3. Include your ZSH version: `zsh --version`
4. Include installation method (Oh My Zsh, manual, etc.)

### Adding New Completions

When the Claude CLI adds new commands or options:

1. Fork the repository
2. Update `_claude` with the new completions
3. Follow the existing patterns and structure
4. Test locally (see Testing section)
5. Submit a pull request

## Development

### Structure

The completion file `_claude` follows ZSH completion conventions:

- Main function: `_claude()`
- Subcommand functions: `_claude_auth()`, `_claude_mcp()`, etc.
- Uses `_arguments` for option parsing
- Uses `_describe` for command listings

### Adding a New Command

Example: Adding a new top-level command `claude foo`:

```bash
# In _claude(), add to commands array:
commands=(
  ...
  'foo:Description of foo command'
)

# In the args case statement:
case $words[1] in
  ...
  foo)
    _claude_foo
    ;;
esac

# Add the new function:
_claude_foo() {
  _arguments \
    '(-h --help)'{-h,--help}'[Display help]' \
    # Add more options here
}
```

### Adding a New Option

Example: Adding `--new-flag` to main options:

```bash
main_options=(
  ...
  '--new-flag[Description of flag]:value:(option1 option2)'
)
```

### Testing

Before submitting:

```bash
# Load the completion in a test shell
zsh -c 'fpath=(. $fpath); autoload -Uz compinit && compinit && source _claude && which _claude'

# Manual testing
# In a new shell with the completion loaded:
claude <TAB>
claude --new-flag <TAB>
```

See `docs/testing-guide.md` for comprehensive testing instructions.

## Style Guidelines

- Use 2 spaces for indentation
- Keep descriptions concise and clear
- Follow existing patterns for consistency
- Group related options together
- Add comments for complex logic

## Pull Request Process

1. Update `_claude` with your changes
2. Test the completions locally
3. Update README.md if adding major features
4. Describe what you changed and why
5. Submit the PR

## Questions?

Open an issue for discussion before making large changes.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
