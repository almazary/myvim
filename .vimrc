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

" \cc atau \cu
Plugin 'scrooloose/nerdcommenter'

" valign =
Plugin 'junegunn/vim-easy-align'

" git
Plugin 'tpope/vim-fugitive'

" :Rg <string|pattern>
Plugin 'jremmen/vim-ripgrep'

Plugin 'maksimr/vim-jsbeautify'

" phpdoc
Plugin 'tobys/vmustache'
Plugin 'tobys/pdv'

Plugin 'junegunn/goyo.vim'

Plugin 'Yggdroot/indentLine'

":GV untuk semua file :GV! untuk file yang sedang dibuka
Plugin 'junegunn/gv.vim'

" search all with :Rg, and then call :EnMasse for open result serach to
" buffers, then call :%s/find/replce
Plugin 'Olical/vim-enmasse'

Plugin 'easymotion/vim-easymotion'

Plugin 'editorconfig/editorconfig-vim'

" Plugin 'w0rp/ale'
Plugin 'dense-analysis/ale'

Plugin 'mhinz/vim-signify'

" save sssion
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-colorscheme-switcher'

" buffer
Plugin 'schickling/vim-bufonly'

" multicusor
Plugin 'terryma/vim-multiple-cursors'

" FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" COLORS
syntax enable
colorscheme onedark
set background=dark

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
" change split sparator color
" hi VertSplit ctermbg=NONE
" Statusline
set laststatus=2 " always show statusline
" set statusline if not yet set in plugin configuration
" set statusline=\(%{toupper(mode())}\)\ \%{fugitive#statusline()}\ %<%t\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set autoread
set encoding=utf-8
"set fileencoding=utf-8
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

" Beautyjs
map <leader>beh :call RangeHtmlBeautify()<cr>
map <leader>bej :call RangeJsBeautify()<cr>
map <leader>beo :call RangeJsonBeautify()<cr>
map <leader>bec :call RangeCSSBeautify()<cr>

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

" macvim
if has("gui_macvim")
    set guifont=Menlo\ Regular:h13
endif

" vimr & macvim
if (has("gui_vimr") || has("gui_macvim") || has('nvim'))
    set guioptions-=L " remove left scroll bar
    set guioptions-=r " remove right scroll bar

    " Make the vertical split separator looks simpler
    set fillchars+=vert:\ " replace separator ith hitespace
    autocmd ColorScheme * hi VertSplit cterm=NONE ctermbg=8 guibg=NONE
    hi VertSplit cterm=NONE ctermbg=8 guibg=NONE
endif

" GOYO
nmap <leader>gy :Goyo 120<CR>
nmap <leader>gc :Goyo!<CR>
let g:goyo_linenr = 1

" signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1
let g:signify_cursorhold_insert = 0
let g:signify_cursorhold_normal = 0

if ((v:version >= 800 && (has('python') || has('python3'))) || has('nvim'))
    let g:ale_lint_delay = 50
    let g:ale_sign_column_always = 1
    let g:ale_linters = {'javascript': ['standard']}
    if (executable('standard'))
        let g:ale_javascript_standard_executable = 'standard'
        let g:ale_javascript_standard_use_global = 1
    endif
    let g:ale_fixers = { 'javascript': 'standard' }
    let g:ale_fix_on_save = 1
    let g:ale_lint_on_enter = 1
endif

" session
let g:session_autoload = 'no'
let g:session_lock_enabled = 0

autocmd BufNewFile,BufRead *.blade.php set ft=html " Fix blade auto-indent

" hightlight the word under the cursor
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

" hilangkan warna signcolum
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
" enable mouse iterm2
set mouse=nicr

" FZF setting
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
nmap <silent> <leader>o :FzfFiles<CR>
nmap <silent> <leader>O :FzfFiles!<CR>
nmap <silent> <leader>b :FzfBuffers<CR>
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir FzfFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" tutup nerdtree jika tidak ada buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline
let g:airline_theme='onedark'

