" Script below experiment to install vim-plug if not already available
if empty(glob('~/.local/share/nvim/plugged'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
"
call plug#begin('~/.local/share/nvim/plugged')
"call plug#begin()
"   This config file should be save here for neovim: .config/nvim/init.vim
"   Plugins should be installed using https://github.com/junegunn/vim-plug
"   and saved here: .local/share/nvim/plugged
" You can specify default directory for plugins directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" Allows to connect to a jupyter console which is useful for viewing charts
" terminal: jupyter qtconsole
" vim: JupyterConnect
Plug 'jupyter-vim/jupyter-vim'

" Plugin which allows % to jump between tags
Plug 'https://github.com/adelarsq/vim-matchit'

" Nerd Tree - nagivate files (\ne) 
Plug 'preservim/nerdtree'
"allows copy paste of filepath in NerdTree (use mb)
Plug'mortonfox/nerdtree-clip'

" code auto-completion and documentation viewing
" shift K: view documentation
" gd: to do definition of function
" :Pyimport pandas -> opens pandas import file
" /r : rename variable
" Cntrl space :autocomplete suggestions
Plug 'davidhalter/jedi-vim'

" Shows errors in code indicated by >>
" The error comment is shown in the status bar below
Plug 'dense-analysis/ale'

" Create doc strings for functions use :DocstringTypes
Plug 'pixelneo/vim-python-docstring'

" Allows git commands to be used in vim e.g Git diff
Plug 'tpope/vim-fugitive'
"
" Applies Black formatting to Python files
Plug 'https://github.com/psf/black'
"
" Debugging Interface
Plug 'https://github.com/puremourning/vimspector'
" Changing surrounding (cs) quotes etc.
" cs"' : changes to single quotes
Plug 'tpope/vim-surround'
" Git power bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Quick Search all files:
" :CTRLSF <search_string>
" (enter or o in file script to open)
Plug 'dyng/ctrlsf.vim'

" Github theme plug for neovim
Plug 'projekt0n/github-nvim-theme'
" Buffer cycle
Plug 'jlanzarotta/bufexplorer'

"tool for writing html quickly
Plug 'https://github.com/mattn/emmet-vim'

"Auto close html tabs with > key
Plug 'https://github.com/alvan/vim-closetag'

"auto change both tags when using ciw
Plug 'https://github.com/AndrewRadev/tagalong.vim'
" Add syntax for Jinja
Plug 'https://github.com/lepture/vim-jinja'
" Sneak for navigating more quickly 
Plug 'https://github.com/justinmk/vim-sneak'
" Allow to cycle through copy history when pasting
Plug 'https://github.com/svermeulen/vim-yoink'
" better way of replacing words
Plug 'https://github.com/svermeulen/vim-subversive'
" Cutlass - stops delete from going to register
Plug 'https://github.com/svermeulen/vim-cutlass'
" Initialize plugin system
call plug#end()

" show numbers on left
set number
" show matching bracket to one selected
set showmatch
" what does this do?
let python_highlight_all = 1
" Syntax highlighting (i.e. different colours for python code) on
syntax on

"Navigage between buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Defines where default buffer splits goto
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
nnoremap <Leader>q[ ciw[]<Esc>P
nnoremap <Leader>q{ ciw{}<Esc>P

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

" add line numbers to nerd tree / show bookmarks on startup
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1

"add ipdb debug
nmap <Leader>pdb iimport<Space>ipdb<Esc>oipdb.set_trace()<Esc>
nmap <Leader>1pdb i<Tab>import<Space>ipdb<Esc>oipdb.set_trace()<Esc>
nmap <Leader>2pdb i<Tab><Tab>import<Space>ipdb<Esc>oipdb.set_trace()<Esc>

" get file path using \cfp
nmap <Leader>cfp :let @+=expand("%:p")<CR>
" get file path using \cfp2
nmap <Leader>cfp2 :let @+=expand("%")<CR>

"buffers key bindings for bufexplorer
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
map <Leader>bfs :BufExplorer<Enter>
map <Leader>bff :bn<Enter>
map <Leader>bfp :bp<Enter>

" HTML Shortcuts
"add autocomplete html using inbuilt vim autocomplete
"use cntl x cntl o to show options
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"only use emmet plug on html
let g:user_emmet_install_global = 0
" set emet shortcut as ,
let g:user_emmet_leader_key=','
autocmd FileType html,css EmmetInstall
" tidy up html file with tidy (vim standard tool)
" short cut th for tidy html
map <Leader>th :!tidy -mi -html -wrap 0 %

" Yoink for pasting reorder
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)
" Set max paste history for yoink to remember
let g:yoinkMaxItems = 40

" mapping to use vim subversive
" r for substitute
nmap r <plug>(SubversiveSubstitute)
nmap rr <plug>(SubversiveSubstituteLine)
nmap R <plug>(SubversiveSubstituteToEndOfLine)

" Vim cutlass - stops delete from saving to register
" As using vim yoink need to add the below to that cuts get added to register
" Note that x has been replaced therefore have to use dl (i.e. delete letter
" instead)
let g:yoinkIncludeDeleteOperations = 1
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D
