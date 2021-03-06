" Pathogen is installed as git submodule
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
filetype plugin indent on

" Shortcut to open link on browser
map ,f :update<CR>:silent !xdg-open <cfile> > /dev/null 2>&1<CR>:redraw!<CR>

" CD to the directory of the current file
set autochdir

" Default encoding according to locale
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=utf-8,latin1
endif

" mapleader change for easier access
let mapleader = ","

" we want line numbers, syntaxt highlighting
" and info in the message bar
set number
set ruler
syntax on

" viminfo
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command
                        " line history

"Set terminal title to filename
set title

" Solarized theme
" set background=light
set background=dark
colorscheme solarized

" Set encoding
set encoding=utf-8

"Allow switching buffers without writing to disk
set hidden

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,.svn,CVS,*.so,*.swp,*.jpg,*.png,*.xpm,*.gif

" Status bar
set laststatus=2

" Folding
set foldmethod=syntax
set foldcolumn=2
set foldnestmax=10
set foldlevel=999999

" backspace
set bs=2
set backspace=indent,eol,start  " Intuitive backspacing in insert mode

" For text files
function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Text mode wrapping
au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Gist
let g:gist_clip_command = 'xclip -selection clipboard'

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Python version for ConqueTerm
let g:ConqueTerm_PyVersion = 2

" Markdown wiki
fun! s:OpenLink()
  let name = expand('<cWORD>')
  let name = substitute( name , '\(\[\[\|\]\]\)' , '' , 'g')
  exec ':edit ' . name . '.mkd'
endf
nmap <script> K   :call <SID>OpenLink()<CR>

" tComment
" always comment on first line
let g:tcommentOptions = {'col': 1}

" unimpaired.vim
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" VIM notes
let g:notes_directory = '~/Documents/notes'

runtime macros/matchit.vim

