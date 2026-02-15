# VHS demo tape for Claude Code ZSH completions
# Install vhs: https://github.com/charmbracelet/vhs

Output demo.gif

Set FontSize 16
Set Width 1200
Set Height 600
Set Theme "Catppuccin Mocha"
Set Padding 20

Type "# Claude Code ZSH Completions Demo"
Enter
Sleep 1s

Type "# Tab-complete commands"
Enter
Type "claude "
Sleep 500ms
Tab
Sleep 2s
Enter

Type "# Tab-complete subcommands"
Enter
Type "claude mcp "
Sleep 500ms
Tab
Sleep 2s
Enter

Type "# Tab-complete flags"
Enter
Type "claude --"
Sleep 500ms
Tab
Sleep 2s
Enter

Type "# Tab-complete flag values"
Enter
Type "claude --model "
Sleep 500ms
Tab
Sleep 2s
Enter

Type "# Tab-complete nested subcommands (3 levels deep)"
Enter
Type "claude plugin marketplace "
Sleep 500ms
Tab
Sleep 2s
Enter

Type "# Tab-complete MCP flags"
Enter
Type "claude mcp add --"
Sleep 500ms
Tab
Sleep 3s

Sleep 2s
