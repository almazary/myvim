set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'airblade/vim-gitgutter'

" \cc atau \cu
Plugin 'scrooloose/nerdcommenter'

Plugin 'kien/ctrlp.vim'

" valign =
Plugin 'junegunn/vim-easy-align'

" git
Plugin 'tpope/vim-fugitive'

" :Rg <string|pattern>
Plugin 'jremmen/vim-ripgrep'

" autocomplete
Plugin 'maralla/completor.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'maksimr/vim-jsbeautify'

" phpdoc
Plugin 'tobys/vmustache'
Plugin 'tobys/pdv'

Plugin 'scrooloose/syntastic'

Plugin 'junegunn/goyo.vim'

Plugin 'Yggdroot/indentLine'

":GV untuk semua file :GV! untuk file yang sedang dibuka
Plugin 'junegunn/gv.vim'

Plugin 'Olical/vim-enmasse'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" COLORS
syntax enable
colorscheme Tomorrow-Night

" SPACES & TABS
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
autocmd BufWritePre * %s/\s\+$//e

" UI CONFIG
"set number
set showcmd
filetype indent on
set wildmenu
set splitright
set nowrap
set list
set noswapfile
" open diffs in vertical split.
set diffopt +=vertical
" Make the vertical split separator looks simpler
set fillchars+=vert:\ " replace separator with whitespace
autocmd ColorScheme * hi VertSplit cterm=NONE ctermbg=8 guibg=NONE
hi VertSplit cterm=NONE ctermbg=8 guibg=NONE
" Statusline
set laststatus=2 " always show statusline
" set statusline if not yet set in plugin configuration
set statusline=\(%{toupper(mode())}\)\ \%{fugitive#statusline()}\ %<%t\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set autoread
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:\ ,tab:>·,trail:·,extends:>,precedes:<,space:·

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault

" FOLDING
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" MOVEMENT
nnoremap <S-K> 10k
nnoremap <S-J> 10j
nnoremap <S-H> 10h
nnoremap <S-L> 10l
vnoremap <S-K> 10k
vnoremap <S-J> 10j
vnoremap <S-H> 10h
vnoremap <S-L> 10l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" If you are still getting used to Vim and want to force yourself to stop using the arrow keys, add this:
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" FASTER
let mapleader=","
nnoremap ; :
xnoremap ; :
vmap <C-c> "+y
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>
nmap <silent> <leader>vw :windo so $MYVIMRC<CR>
map <leader>tw :tabnew<cr>
map <leader>tp :tabprevious<cr>
map <leader>tn :tabnext<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tc :tabclose<cr>
map <leader>> 40<C-w>>
map <leader>< 40<C-w><

" paste mode :set paste
" unpaste mode :set nopaste
" :echo has('clipboard') => untuk cek clipboard vim ada atau enggak

" :help nama plugin => untuk lihat dokumentasi sebuah plugin
" ctrl-] untuk menuju ke topik, ctrl-T untuk balik

" valigin
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" NERD Tree mappings:
nmap <leader>nt :NERDTree<cr>
nmap <leader>nn :NERDTreeToggle<cr>
"nmap <leader>nb :NERDTreeFromBookmark
"nmap <leader>nf :NERDTreeFind<cr>
let NERDTreeShowHidden=1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Ctrl P
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_map = '<c-f>'
nmap <C-b> :CtrlPBuffer<CR>
nmap <C-u> :CtrlPMRU<CR>

" Beautyjs
map <leader>bh :call RangeHtmlBeautify()<cr>
map <leader>bj :call RangeJsBeautify()<cr>
map <leader>bo :call RangeJsonBeautify()<cr>
map <leader>bc :call RangeCSSBeautify()<cr>

" https://github.com/beautify-web/js-beautify
let g:config_Beautifier = {}
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].preserve_newlines = '0'
let g:config_Beautifier['html'].max_char = '0'
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].preserve_newlines = '0'
let g:config_Beautifier['js'].max_char = '0'
let g:config_Beautifier['json'] = {}
let g:config_Beautifier['json'].preserve_newlines = '0'
let g:config_Beautifier['json'].max_char = '0'
let g:config_Beautifier['css'] = {}
let g:config_Beautifier['css'].preserve_newlines = '0'
let g:config_Beautifier['css'].max_char = '0'

" PHP documenter
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
nnoremap <leader>dc :call pdv#DocumentCurrentLine()<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nmap <leader>st :SyntasticToggleMode<CR>
nmap <leader>sc :SyntasticCheck<CR>
let g:syntastic_mode_map = {'passive_filetypes': ['html']}

" COMPLETOR
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" macvim
if has("gui_macvim")
    set guifont=Menlo\ Regular:h13
    set guioptions-=L " remove left scroll bar
    set guioptions-=r " remove right scroll bar
endif

" GOYO
nmap <leader>gy :Goyo 120<CR>
nmap <leader>gc :Goyo!<CR>
let g:goyo_linenr = 1

" gitgutter
let g:gitgutter_realtime = 0 " disable realtime update, in hope vim doesn't lag
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 250
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>G :GitGutterLineHighlightsToggle<CR>

