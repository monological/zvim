"
"
"                                   
"           ________  ___      ___ ___  _____ ______      
"          |\_____  \|\  \    /  /|\  \|\   _ \  _   \    
"           \|___/  /\ \  \  /  / | \  \ \  \\\__\ \  \   
"               /  / /\ \  \/  / / \ \  \ \  \\|__| \  \  
"              /  /_/__\ \    / /   \ \  \ \  \    \ \  \ 
"             |\________\ \__/ /     \ \__\ \__\    \ \__\
"              \|_______|\|__|/       \|__|\|__|     \|__|
"                                                           
"
"
"   Copyright (c) 2015 monological
"   Licensed under MIT License
"
"

set nocompatible

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif


" GENERAL
"
filetype plugin on
filetype indent on
set history=1000
set autoread
let mapleader = ','
let g:mapleader = ','


" UI
"
set linespace=0
set scrolloff=3     " lines to keep on screen before jumping
set scrolljump=5    " how much to jump
set mouse=a         " allow mouse usage
set mousehide       " hide mouse when typing
set wildmenu        " show list instead of completing
set wildmode=list:longest,full
set wildignore=*.0,*~,*.pyc,.git/*,.hg/*,.svn\*i
set backspace=eol,start,indent
set whichwrap=b,s,h,l,<,>,[,]
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set list            " list hidden chars
set smartcase       
set ignorecase
set hlsearch
set incsearch
set lazyredraw      " no redraw when executing macro
set magic           " regex
set showmatch       " matching brackets
set mat=2           " 1/10 of s to blink 
set noerrorbells    " bells off
set novisualbell    " bells off
set splitbelow      " sp opens on bottom
set showmode        " show current mode
set nofoldenable    " folding off
set cursorline      " show currrent line
set shortmess+=filmnrxoOtT
set virtualedit=onemore 


" COLOR
"
syntax on
try
    colorscheme solarized
catch
endtry
set background=dark
set encoding=utf-8
set ffs=unix,dos,mac


" FORMAT
"
set nowrap          " wrap text if too long
set expandtab       " tab is space
set smarttab        " tab intelligently
set shiftwidth=4    " four space tab
set tabstop=4       " indentation every four columns
set softtabstop=4   " backspace deletes space
set nojoinspaces    " no double space after punctuation  
set autoindent      " indent based on previous line
set smartindent     " indent intelligently


" NAVIGATE
"

noremap j gj        " wrapped lines go to next row
noremap k gk        " wrapped lines go to next row
map zl zL           " better horizontal scrolling
map zh zH           " better horizontal scrolling

" move left between windows
map <C-H> <C-W>h<C-W>_                          
map <C-J> <C-W>j<C-W>_                          
map <C-K> <C-W>k<C-W>_                          
map <C-L> <C-W>l<C-W>_                          

" toogle search highlight
nmap <silent> <leader>/ :set invhlsearch<CR>    

" disable highlight
map <silent> <leader><cr> :noh<cr>              

" don't restore cursor for git messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" restore the cursor from previous session
func! RestoreCursor()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call RestoreCursor()
augroup END

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>       


" EDITING
"
" rm windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" toggle spell check
map <leader>ss :setlocal spell!<br>

" toggle paste mode
map <leader>p :setlocal paste!<CR>

" Delete whitespace for python and coffeescript
func! DeleteTrailing()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailing()
autocmd BufWrite *.coffee :call DeleteTrailing()

" allow repeat in visual mode
vnoremap . :normal .<CR>

" allow saves if you forgot sudo
cmap w!! w !sudo tee % >/dev/null

" Adjust split views to same size
map <Leader>= <C-w>=

" search for lines under keyword
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr . "[\t"<CR>


" PLUGINS
"

" airline
let g:airline_theme="luna"

" syntastic
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_checkers=['jshint']

" ctrl-p
let g:ctrlp_working_path_mode=0
let g:ctrlp_map = 



