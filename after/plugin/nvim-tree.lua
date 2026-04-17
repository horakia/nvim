-- Disable netrw completely so nvim-tree becomes the default
-- vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors for better icon colors
vim.opt.termguicolors = true

-- Define diagnostic signs before nvim-tree setup
vim.fn.sign_define("NvimTreeDiagnosticErrorIcon", {text = "", texthl = "NvimTreeDiagnosticError"})
vim.fn.sign_define("NvimTreeDiagnosticWarnIcon", {text = "", texthl = "NvimTreeDiagnosticWarn"})
vim.fn.sign_define("NvimTreeDiagnosticInfoIcon", {text = "", texthl = "NvimTreeDiagnosticInfo"})
vim.fn.sign_define("NvimTreeDiagnosticHintIcon", {text = "", texthl = "NvimTreeDiagnosticHint"})

-- Setup nvim-tree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
    side = "left",
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache" },
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  diagnostics = {
    enable = false,  -- Disable diagnostics for now to avoid errors
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

-- Key mappings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle file tree" })
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = "Toggle tree at current file" })
vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle file tree" })

-- Make :Ex and :E open nvim-tree (with icons) instead of netrw
-- vim.api.nvim_create_user_command('Ex', 'NvimTreeToggle', {})
vim.api.nvim_create_user_command('E', 'NvimTreeOpen .', {})

-- Auto close nvim-tree if it's the last window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end
})
