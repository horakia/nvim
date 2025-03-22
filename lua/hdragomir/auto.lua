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
