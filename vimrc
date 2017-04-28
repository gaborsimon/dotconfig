" ====== BASICS ===================================================================================
    set nocompatible            " explicitly get out of vi-compatible mode
    colorscheme solarized       " color scheme
    syntax on                   " syntax highlighting on
" =================================================================================================


" ====== GRAPHICAL SETTINGS =============================================================================
    if has("gui_running")
        set background=light    " we plan to use a light background
        set guioptions=ce       " e = use simple dialogs rather than pop-ups
                                " c = use GUI tabs, not console style tabs
        set guioptions-=T       " T = remove the toolbar
        set mousehide           " hide the mouse cursor when typing
    else
        set t_Co=256                    " needed for console mode
        let g:solarized_termcolors=256  " enable degraded color mode, this is needed only if you do not apply solarized colors to your terminal emulator
        set background=light            " we plan to use a dark background
    endif
" =================================================================================================


" ====== USER INTERFACE ===========================================================================
    set tabpagemax=100          " limit of the open tabs (default is 10)
    set backspace=indent,eol,start
    set number                  " turn on line numbers
    set numberwidth=5           " good up to 99999 lines
if has("gui_running")
    set cursorline              " highlight current line
endif
    set wildmenu                " visual autocomplete for command menu 
    set lazyredraw              " redraw only when we need to
    set showcmd                 " show the command being typed
    set showmatch               " show matching brackets
    set incsearch               " search as characters are entered
    set hlsearch                " highlight matches
    set novisualbell            " do not blink
    set report=0                " tell us when anything is changed
    set ruler                   " always show current positions along the bottom
    set laststatus=2            " always show the status line
    set statusline=\ [%n]       " buffer number
    set statusline+=\ %<%F      " full path to the file with truncate if needed
    set statusline+=%m%r%h%w    " modified / readonly / help / preview flags
    set statusline+=\ [%{&ff}]  " file format
    set statusline+=\ [%Y]      " file type
    set statusline+=%=          " separation between left and right items
    set statusline+=\ [%L]      " number of lines in buffer
    set statusline+=\ [%l,%v]   " current line and column
    set statusline+=\ [%p%%]\   " percentage through file in lines
" =================================================================================================


" ====== TEXT FORMATTING ==========================================================================
    set softtabstop=4           " when hitting tab or backspace, how many spaces should a tab be
    set tabstop=4               " real tabs should be 4, and they will show with set list on
    set expandtab               " no real tabs
    set cindent                 " C file related ident
    set shiftwidth=4            " auto-indent amount when using cindent
    set ignorecase              " case insensitive by default
    set nowrap                  " do not wrap line
" =================================================================================================


" ====== SHORTCUTS ================================================================================
    " F2 - Previous tab
    nnoremap <silent> <F2> :tabp<CR>
    " F3 - Previous tab
    nnoremap <silent> <F3> :tabn<CR>
    " F4 - Previous buffer
    nnoremap <silent> <F4> :bp<CR>
    " F5 - Next buffer
    nnoremap <silent> <F5> :bn<CR>
    " F10 - Turn off the highlighting after search
    nnoremap <silent> <F10> :nohlsearch<CR>
    " CTRL+BACKSPACE - Remove all of the whitespace characters from the end of the lines
    nnoremap <silent> <c-bs> :%s/\s\+$//<CR>
" =================================================================================================
