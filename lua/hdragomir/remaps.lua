vim.g.mapleader = " "
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)
vim.keymap.set("n", "<C-e>", vim.cmd.Ex)

vim.keymap.set("n", "<leader><space>", vim.cmd.noh)
vim.keymap.set("n", "\\<space>", vim.cmd.noh)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>kzz")
vim.keymap.set("n", "<C-u>", "<C-u>jzz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set('n', '<leader>b', ':Gitsigns blame_line<CR>')


vim.keymap.set('n', '<C-/>', 'gcc', { noremap = true, silent = true })
vim.keymap.set('v', '<C-/>', 'gc', { noremap = true, silent = true })

vim.keymap.set('n', '<M-p>', '<Esc><C-p>')

vim.keymap.set('n', '<leader>S', function()
  local current_word = vim.fn.expand("<cword>")
  vim.cmd.Ag()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(current_word .. "", true, false, true), 'n', true)
end, { desc = "tbgs current word" })

vim.keymap.set('v', '<leader>S', function()
  vim.cmd('noau normal! "zy')
  local selected_text = vim.fn.getreg('z')
  selected_text = selected_text:gsub('\n', ' ')
  vim.cmd.Ag()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(selected_text .. "", true, false, true), 'n', true)
end, { desc = "tbgs selected text" })


vim.keymap.set('n', '<leader>cp', function()
  local git_root = vim.fn.system('git rev-parse --show-toplevel'):gsub('\n', '')
  local file_path = tostring(vim.fn.expand('%:p'))
  local relative_path = file_path:gsub(git_root .. '/', '')
  local line_num = vim.fn.line('.')
  local result = relative_path .. ':' .. line_num
  vim.fn.setreg('+', result)
  print('Copied: ' .. result)
end, { desc = 'Copy relative path with line number' })


vim.keymap.set('v', '<leader>cp', function()
  local git_root = vim.fn.system('git rev-parse --show-toplevel'):gsub('\n', '')
  local file_path = tostring(vim.fn.expand('%:p'))
  local relative_path = file_path:gsub(git_root .. '/', '')
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  local result = tostring(relative_path) .. ':' .. tostring(start_line) .. '-' .. tostring(end_line)
  vim.fn.setreg('+', result)
  print('Copied: ' .. result)
end, { desc = 'Copy relative path with line range' })
