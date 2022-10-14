call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'jupyter-vim/jupyter-vim'
Plug 'sillybun/vim-repl'

" Plugin which allows % to jump between tags
Plug 'https://github.com/adelarsq/vim-matchit'
"allows copy paste of filepath in NerdTree
Plug'mortonfox/nerdtree-clip'
" Allows connection to a jupyter console 
Plug'jupyter-vim/jupyter-vim'

Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'
" Create doc strings for functions use :DocstringTypes
Plug 'pixelneo/vim-python-docstring'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/psf/black'
Plug 'https://github.com/puremourning/vimspector'
Plug 'tpope/vim-surround'
" Git power bar
Plug 'vim-airline/vim-airline'
Plug 'puremourning/vimspector'

" Quick Search all files: (enter or o in file script to open)
Plug 'dyng/ctrlsf.vim'
" Github theme plug
Plug 'projekt0n/github-nvim-theme'
" Initialize plugin system
call plug#end()
set number
set showmatch
let python_highlight_all = 1
syntax on




"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow splitright
map <Leader>tt :vnew term://

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
nmap <Leader>db <Plug>VimspectorBreakpoints

set encoding=utf-8

"set normal backwards delete
set backspace=indent,eol,start
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"set clipboard settings so that can use yank
set clipboard=unnamed
set ma

"keyboard short cut for wrapping word in quotes \q" 
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q( ciw()<Esc>P



"setup ale fixers
let b:ale_fixers = ['isort']

" Set default formatting for vim-python-doc-string
let g:python_style = 'numpy'

" autorun black on save
autocmd BufWritePost *.py execute 'Black'

let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
" vim spectpor debug baloon shortcut
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <Leader><F2> <Plug>VimspectorUpFrame
nmap <Leader><F12> <Plug>VimspectorDownFrame
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
" NERDTree shortcut
nmap <leader>ne :NERDTreeToggle<cr>

" vim-airline git power bar - add buffer tab functionality, and set so only
" shows end of buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Set text width to 79 for python files (can highlight text and use gq to
" autoformat to correct line length)
au BufRead,BufNewFile *.py setlocal textwidth=80

" Use github color scheme
colorscheme github_dark_default
" Over-ride search highlight color
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Red

" activate vim-matchit (plugin for using % to jump to next div tag)
packadd! matchit

" Set ctrlsf search tool to use current working directory as root for searches
let g:ctrlsf_default_root = 'cwd'

" add line numbers to nerd tree
let NERDTreeShowLineNumbers=1
