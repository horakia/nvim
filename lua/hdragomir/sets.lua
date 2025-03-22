vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.foldmethod = "indent"
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.cmd[[let g:netrw_liststyle = 3]]

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.diffopt:append("vertical")
