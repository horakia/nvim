-- Configure fzf to use bat for syntax highlighting in preview
vim.env.FZF_DEFAULT_OPTS = '--preview "bat --color=always --style=numbers --line-range=:500 {}" --preview-window=right:60%:wrap'

-- For GitFiles and Files commands specifically
vim.g.fzf_preview_window = {'right:60%:wrap', 'ctrl-/'}
vim.g.fzf_files_options = '--preview "bat --color=always --style=numbers --line-range=:500 {}" --preview-window=right:60%:wrap'
vim.g.fzf_gitfiles_options = '--preview "bat --color=always --style=numbers --line-range=:500 {}" --preview-window=right:60%:wrap'

-- Configure Ag to show preview with context
vim.cmd([[
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 '--color-path "35" --color-line-number "32"',
    \                 fzf#vim#with_preview('right:60%', 'ctrl-/'),
    \                 <bang>0)
]])

vim.keymap.set("n", "<C-p>", vim.cmd.GitFiles, {})
vim.keymap.set("n", "<D-p>", vim.cmd.GitFiles, {})
vim.keymap.set("n", "<M-p>", vim.cmd.GitFiles, {})
vim.keymap.set("n", "<leader>F", vim.cmd.Files, {})
vim.keymap.set("n", "<leader>tbgs", vim.cmd.Ag, {})


