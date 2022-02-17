call plug#begin("~/.config/nvim/autoload/plugged")
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-abolish'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-sleuth'
    " Plug 'scrooloose/syntastic' " is EXTREMELY slow, and locks in the buffer while linting (quite
    " verbose though!)
    Plug 'dense-analysis/ale' " hopefully asynchronous linting (checks for snake_case etc.)
    Plug 'tpope/vim-jdaddy'
    Plug 'vim-scripts/xoria256.vim' " no longer sing it as it is too 'bland'
    " new colorscheme for python
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'vim-scripts/DrawIt'
    " Plug 'lervag/vimtex'
    Plug 'kien/ctrlp.vim'
    Plug 'nachumk/systemverilog.vim'
    Plug 'yegappan/mru'
    Plug 'Shougo/unite.vim'
    Plug 'vim-scripts/Super-Shell-Indent'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'wellle/targets.vim'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'rhysd/clever-f.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'tommcdo/vim-lion'
    Plug 'davidhalter/jedi-vim'
    Plug 'vim-python/python-syntax'
    Plug 'preservim/nerdtree'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    " Hopefully for autocomplete...
    Plug 'zchee/deoplete-jedi'
    let g:deoplete#enable_at_startup = 1
    " Plug 'neoclide/coc-python'
    " if executable('python')
    "     Plug 'sjl/gundo.vim'
    " endif
    " Plug 'autozimu/LanguageClient-neovim', {
        "     \ 'branch': 'next',
        "     \ 'do': 'bash install.sh',
        "     \ }
    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'
    " Plug 'jiangmiao/auto-pairs' " bit useless as it doesnt allow for the quotation remap
    Plug 'preservim/tagbar' " tagbar for overview of functions / classes / variables

    "{{{ Rust things

    " all failed https://dev.to/drmason13/configure-neovim-for-rust-development-1fjn

    "

    "}}}



    "{{{ C++ things

    " installed nodejs, npm | NEVER NEVER NEVER go this way again

    " Plug 'neoclide/coc.nvim', {'branch': 'release'} | is a piece of shit that collides and NEVER

    " allows to be disabeled

    " WHAT WORKED https://github.com/deoplete-plugins/deoplete-clang

    " installed apt-get install clang | works well enough!

    Plug 'zchee/deoplete-clang'

    Plug 'ludovicchabant/vim-gutentags'

    "}}}







call plug#end()

"}}}





" {{{ Syntastic lion 



" let g:syntastic_always_populate_loc_list = 1

" let g:syntastic_auto_loc_list = 1

" let g:syntastic_check_on_open = 1

" let g:syntastic_check_on_wq = 0





" }}}



" lion

let g:lion_squeeze_spaces = 1



" clever-f

let g:clever_f_across_no_line = 1

let g:clever_f_timeout_ms = 3000



" NERDTree

let NERDTreeShowHidden=1

let g:NERDTreeWinSize=27

" Function from https://stackoverflow.com/questions/8584182/how-to-refresh-in-nerdtree-plugin

" Remaps F9 to refresh NERDTree if I get new files in a directory

nmap <F9> :NERDTreeFocus<Enter>R<c-w><c-p>

" Remaps F10 to respawn NERDTree if I have to reshufle things

nmap <F10> :NERDTree<Enter>



"jedi

let g:jedi#documentation_command = ","

let g:jedi#completions_enabled = 0

let g:jedi#show_call_signatures = "0"

let g:jedi#popup_on_dot = 0



" tagbar

nmap <F8> :TagbarToggle<CR>

let g:tagbar_use_cache = 0



" deoplete-clang | look in filetype specific options



" {{{ setting stuff

filetype plugin indent on

filetype indent on

filetype on



set ttyfast



set wildmenu

set wildmode=list,full

syntax on

syntax enable



set number



set nocompatible

set encoding=utf-8

"set winaltkeys=no



set hidden

set autoindent

set smartindent



set nospell





set cursorline

set autoread



set lazyredraw



set showmatch



"splitting behaviour

"splitting with 'i' opens new buffer below current

set splitbelow

"splitting with 's' opens new buffer on the right of current

set splitright



"fix backspace

set backspace=indent,eol,start

" }}}







set formatoptions-=cro



silent! colo xoria256







" colorcolumn to enforce proper code length

set colorcolumn=100

" same color as the line bar

highlight ColorColumn ctermbg=237





let mapleader=";"

let maplocalleader=";"





" trying no backup

set nobackup

set noswapfile



" {{{ Searching 

" highlight search

set hlsearch

" case inferred by default

set infercase

" make searches case-insensitive

set ignorecase

"unless they contain upper-case letters:

set smartcase

" show the `best match so far' as search strings are typed:

set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:

set gdefault

" }}}



" ### Line Wrapping ###################################################

" don't make it look like there are line breaks where there aren't:

set nowrap

" Wrap at word

set linebreak



set textwidth=100





if &term =~ '256color'

	" Diable Background Color Erase (BCE) so that color schemes

	" work properly when Nvim (?) is used inside tmux and GNU screen.

	" For Vim this should work see http://snk.tuxfamily.org/log/vim-256color-bce.html

	set t_ut=

endif





" {{{ remaps

nnoremap <C-q> i'<ESC>ea'<ESC>



nnoremap <silent> U :redo<CR>



"changes directory to the one of the current buffer

nnoremap cd :cd %:h<cr>



"copy to system clipboard

noremap <Leader>y "*y

noremap <Leader>p "*p



"moving between tabs

nnoremap H gT

nnoremap L gt



nnoremap <c-h> <c-w>h

nnoremap <c-l> <c-w>l

nnoremap <c-j> <c-w>j

nnoremap <c-k> <c-w>k



"nnoremap L <c-w>l

"nnoremap H <c-w>h



"j,k now follow wrapped lines

nnoremap j gj

nnoremap k gk



" bigger jumps

nnoremap J 20gj

nnoremap K 20gk



" map " to '

function PythonComment()

    inoremap " '

    inoremap ' "

    setlocal filetype=python

    let b:ale_linters = ['flake8', 'pylint']

    let b:ale_fixers = ['autopep8', 'yapf']

    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '⚠'

    let b:ale_fix_on_save = 1

    let g:airline#exensions#ale#enabled = 1

endfunction



"remap the join hotkey to M

vnoremap M J



"python run mappings

"highlight all??

" map <F5> ggVG

map <F5> ggVG"ry:echo system('python3', @r)<Enter>

"buffer to r and append to r

" vmap <F2> "ry

" vmap <F6> c<Esc>"*p

" disabeled cause barely used

" vmap <F3> "Ry

"execute buffer from r, without confirmation

" nmap <F4> :echo system('python3', @r)<Enter>

"

" cpp save and run mappings

nmap <F1> :w<Enter>:!g++ -o %:r %<Enter>:!./%:r<Enter>

" cpp ctags current file with all attributes

nmap <F2> :!ctags -R --c++-kinds=l %<Enter>

" cpp run current file

nmap <F3> :!./%:r<Enter>

"remap vim help to run, which is alias for cargo run and runs current rust file

" nmap <F1> :!run

" nmap <F3> :!check



" create folds

" {{{ old | new ones depend on tpope commentary

" nnoremap <F11> I<Enter><Esc>kA#<Esc>

" nnoremap <F12> A<Enter>#<Esc>

" https://github.com/tpope/vim-commentary/blob/master/plugin/commentary.vim at the bottom are the

" options for CommentaryXYZ where XYZ are certain 'moves'

" }}}



map <F11> I<Enter><Esc>kA<Esc><Plug>CommentaryLine

map <F12> A<Enter><Esc><Plug>CommentaryLine



nnoremap <silent> <c-u> :nohl<CR>



"german keyboards don't like ]

"interestingly enough, this does nothing either way

" nnoremap <C-i> <C-]>



" to make Y behave like D

nnoremap Y y$



" insert new line without going into insert mode

nnoremap <Enter> o<ESC>



" have Q reformat the current paragraph (or selected text if there is any):

nnoremap Q gqap

vnoremap Q gq

"allow deleting selection without updating the clipboard (yank buffer)

vnoremap x "_x

vnoremap X "_X



" search for visually highlighted text

vmap // y/<C-R>"<CR>



" }}}



" {{{ semshi functions

" Parameters are what a function gets

" Self is an object reference

" testing other function

function CustomHighlights()

    hi semshiSelf   ctermfg=red guifg=#EE6773

    hi semshiParameter  ctermfg=63 guifg=#0000ff

    " hi semshiBuiltin    ctermfg=yellow

    " hi semshiParameter  ctermfg=yellow guifg=#0000ff

    " hi semshiFree   ctermfg=35 guifg=#ffff5f

endfunction

" big function does not work well

" function CustomHighlights()

" 	hi semshiLocal           ctermfg=209 guifg=#ff875f

" 	hi semshiGlobal          ctermfg=214 guifg=#ffaf00

" 	hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold

" 	hi semshiParameter       ctermfg=75  guifg=#5fafff

" 	hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline

" 	hi semshiFree            ctermfg=218 guifg=#ffafd7

" 	hi semshiBuiltin         ctermfg=207 guifg=#ff5fff

" 	hi semshiAttribute       ctermfg=49  guifg=#00ffaf

" 	hi semshiSelf            ctermfg=249 guifg=#b2b2b2

" 	hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline

" 	hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

"     hi semshiClass           ctermfg=yellow

	

" 	hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000

" 	hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000

" 	sign define semshiError text=E> texthl=semshiErrorSign

" endfunction



" }}}





" {{{ foldmethods

" locally set tab settings everywhere

au! BufEnter * setlocal tabstop=4 | setlocal softtabstop=4 | setlocal shiftwidth=4 | setlocal expandtab



au! FileType tex setlocal formatoptions+=t | setlocal spell



au! FileType vim setlocal foldmethod=marker



au! FileType python setlocal foldmethod=marker 

"| call CustomHighlights()

autocmd ColorScheme * call CustomHighlights()



" g:semshi#python



au! FileType php setlocal foldmethod=marker



au! FileType html setlocal foldmethod=marker



au! FileType vhdl setlocal commentstring=--%s



au! FileType sourcelist setlocal commentstring=//%s



" au! FileType rust setlocal commentstring=//%s "TODO

" au! FileType rust call deoplete#custom#buffer_option('auto_complete', v:false)

" au! FileType rust set shellcmdflag=-ic



" }}}



" always open NERDTree on start

au! VimEnter * NERDTree

"autocmd VimEnter * set paste

" Go to previous (last accessed) window

autocmd VimEnter * wincmd p

" close vim if NERDTree is last buffer

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif





" {{{ filetype settings

" au! BufEnter *.tmp set filetype=tex



" au! BufNewFile *.vhd 0r ~/vkarasen-config/vim/skeleton.vhd



au! BufEnter wscript* set filetype=python



au! BufEnter *.py call PythonComment()



au! BufEnter *vimrc set filetype=vim



au! BufEnter *.do set filetype=tcl



au! BufEnter *.slst set filetype=sourcelist



au! BufEnter *.php set filetype=php



au! BufEnter *view.php set filetype=phtml



au! BufEnter *.rs call RustCall() "set filetype=rust

function RustCall()

    "https://dev.to/drmason13/configure-neovim-for-rust-development-1fjn customization and plugins!

    "fails

    set filetype=rust



endfunction



au! BufEnter *.cpp call CppCall()

function CppCall()

    let g:deoplete#sources#clang#libclang_path="/usr/lib/x86_64-linux-gnu/libclang-10.so.1"

    let g:deoplete#sources#clang#clang_header="/lib/clang"

    " let ale_linters=

    let ale_fixers=['clang-tidy']

    set filetype=cpp

    setlocal foldmethod=marker

    nmap , <c-w>}

    " let g:gutentags_add_default_project_roots = 0

    " let g:gutentags_project_root = ["



endfunction



au! BufEnter *.csv set filetype=csv

" }}}



" {{{ airline settings for unicode stuff





let g:deoplete#enabel_at_startup = 1

let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='bubblegum'

let g:airline#extensions#ctrlp#show_adjacent_modes = 1

let g:airline#extension#whitespace#enabled = 0

let g:gutentags_dont_load = 1

au! BufWritePost * if &ft ==# 'vim' | source % | :silent AirlineRefresh | endif





" air-line

 let g:airline_powerline_fonts = 1



 if !exists('g:airline_symbols')

     let g:airline_symbols = {}

     endif



" unicode symbols

let g:airline_left_sep = '»'

let g:airline_left_sep = '▶'

let g:airline_right_sep = '«'

let g:airline_right_sep = '◀'

let g:airline_symbols.linenr = '␊'

let g:airline_symbols.linenr = '␤'

let g:airline_symbols.linenr = '¶'

let g:airline_symbols.branch = '⎇'

let g:airline_symbols.paste = 'ρ'

let g:airline_symbols.paste = 'Þ'

let g:airline_symbols.paste = '∥'

let g:airline_symbols.whitespace = 'Ξ'





" }}}
