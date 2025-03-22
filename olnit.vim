call plug#begin('~/.local/share/nvim/plugged')
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
call plug#end()

set syntax
set background=dark
set termguicolors
set ignorecase
set smartcase
set nowrap
set signcolumn=yes
set relativenumber
set number
" colorscheme tokyonight-night
colorscheme onedark

set shiftwidth=2 smarttab
set foldmethod=indent
set expandtab

highlight Folded guifg=PeachPuff4

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufWritePre *.* %s/\s\+$//e

autocmd FileType reason setlocal foldmethod=expr
autocmd FileType reason setlocal foldexpr=REFolds()

function! REFolds()
  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^open.*$'
    return 1
  else
    return indent(v:lnum) / &shiftwidth
  endif
endfunction


nmap <leader><space> :noh<Cr>
nmap <C-p> :GFiles<Cr>
vnoremap <D-j> :GFiles<Cr>
nnoremap <C-u> :UndotreeToggle<CR>

set hidden
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
let g:fzf_vim.buffers_jump = 1

let g:LanguageClient_serverCommands = {
   \ 'reason': ['/Users/hdragomir/rls-macos/reason-language-server'],
   \ }

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
