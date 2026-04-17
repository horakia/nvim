vim.cmd[[match TrailingWhitespace /\s\+$/]]

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {"*.*"},
  command = [[ %s/\s\+$//e ]]
})

vim.o.foldenable = true

--  folds are defined by a user-defined expression (tree-sitter)
vim.o.foldmethod = 'expr'

-- let tree-sitter define folds
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true  -- Break at word boundaries
    vim.opt_local.textwidth = 0     -- Disable hard wrapping
  end,
})

vim.filetype.add({
  extension = {
    re = 'rescript',
    rei = 'rescript',
  },
})
