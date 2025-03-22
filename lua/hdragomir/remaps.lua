vim.g.mapleader = " "
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

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
