# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration using Lua as the primary language with vim-plug for plugin management. The configuration follows Neovim's standard directory structure with modular organization.

## Architecture & Structure

The configuration is organized into distinct modules under `lua/hdragomir/`:

- **init.lua**: Main entry point that requires all hdragomir modules
- **lua/hdragomir/plug.lua**: Plugin definitions using vim-plug
- **lua/hdragomir/sets.lua**: Editor settings (indentation, line numbers, etc.)
- **lua/hdragomir/remaps.lua**: Custom key mappings (leader = space)
- **lua/hdragomir/colours.lua**: Tokyo Night theme configuration
- **lua/hdragomir/auto.lua**: Autocommands (whitespace handling, folding)
- **after/plugin/**: Plugin-specific configurations loaded after plugins

## Key Commands

### Plugin Management
- Install/Update plugins: Open Neovim and run `:PlugInstall` or `:PlugUpdate`
- Clean unused plugins: `:PlugClean`

### Development Workflow
- Open file finder: `<C-p>` (git files) or `<leader>F` (all files)
- Text search: `<leader>tbgs`
- Toggle undo tree: `<leader>u`
- Git status: `<leader>gs`
- Git blame: `<leader>b`
- Format code: `<leader>fmt` or `<leader>ff`

### LSP Operations
- Go to definition: `gd` or `<C-]>`
- Show hover info: `K`
- Find references: `<leader>vrr`
- Rename symbol: `<leader>vrn`
- Code actions: `<leader>vca`

## Important Implementation Details

### LSP Configuration
LSP is configured via lsp-zero v3.x with Mason for automatic server installation. Language servers are defined in `after/plugin/lsp-zero.lua` with specific configurations for:
- Go (gopls with gofumpt and staticcheck)
- Lua (lua_ls with Neovim runtime)
- Elixir (elixirls)
- TypeScript/JavaScript (tsserver, denols)
- ReScript (rescriptls)

### Plugin System
Uses vim-plug accessed through Lua with `vim.fn['plug#']()` calls. Plugins are defined in `lua/hdragomir/plug.lua` and configurations are split into individual files under `after/plugin/`.

### Custom Behaviors
- Automatic trailing whitespace removal on save
- Tree-sitter based code folding
- System clipboard integration with `<leader>y`
- Visual line movement with `J`/`K`
- Path copying with line numbers using `<leader>cp`

## Working with this Configuration

When modifying:
1. Plugin additions go in `lua/hdragomir/plug.lua`
2. Plugin configurations go in `after/plugin/<plugin-name>.lua`
3. Key mappings belong in `lua/hdragomir/remaps.lua`
4. Editor settings belong in `lua/hdragomir/sets.lua`
5. Autocommands belong in `lua/hdragomir/auto.lua`

Follow the existing Lua patterns using `vim.keymap.set()`, `vim.opt`, and `vim.api.nvim_create_autocmd()`.