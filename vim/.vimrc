execute pathogen#infect()

" general display
set t_Co=256

" gruvbox coloring
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" YCM stuff
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" syntax
syntax enable
set modeline

" 80, 120 character warnings
let &colorcolumn="80,".join(range(120,999),",")

" formatting
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
set nowrap

" ui
set number              " show line numbers
set showcmd             " show command in bottom bar

" search
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

" fix for backspace with YCM
set backspace=indent,eol,start

" clean trailing whitespace and save cursor
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"vagrant
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup end

" generate templates
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile Vagrantfile 0r ~/.vim/templates/skeleton.vagrant
  augroup END
endif
