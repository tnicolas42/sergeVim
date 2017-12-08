" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    basic_function.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/05 12:11:11 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/09 00:48:08 by tnicolas         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" **************************************************************************** "
"                                      __      ___                             "
"                                      \ \    / (_)                            "
"                 ___  ___ _ __ __ _  __\ \  / / _ _ __ ___                    "
"                / __|/ _ \ '__/ _` |/ _ \ \/ / | | '_ ` _ \                   "
"                \__ \  __/ | | (_| |  __/\  /  | | | | | | |                  "
"                |___/\___|_|  \__, |\___| \/   |_|_| |_| |_|                  "
"                               __/ |                                          "
"                              |___/                                           "
"                                                                              "
" **************************************************************************** "

"""""""""""""""""""""""""""""""""""""basic function"""""""""""""""""""""""""""""
colorscheme ron
set nocompatible "more vim function
filetype off
set noautoindent "indent gestion with plugin
filetype indent plugin on
set cindent "indent for c files
set smartindent "autoindent
syn on "coloration syntax
set number "number of line
"min line visible around cursor
exe 'set so=' . g:min_number_line_ar_cur
if g:enable_mouse == 1
	set mouse=a "mouse on

else
	set mouse=
endif
set tabstop=4 "tab size
set shiftwidth=4 "tab size
set noexpandtab "no replace tab to space
set omnifunc=syntaxcomplete#Complete "autocompletion (<C-n>)
set showcmd "see command
"set rulerformat=%27(%{strftime('%a\ %e\ %b\ %I:%M\ %p')}\ %2l,%-2(%c%V%)\ %P%)
set showmode "mode in status bar
set shm=a "intelligent print of avertissement
set laststatus=2 "show always status bar (not only on split mode
set cmdheight=1 "size of command bar
set colorcolumn=81 "column 81 in red
set autowrite "auto save when change buffer
set clipboard=unnamed "to copy and paste
if g:highlight_search == 1
	set hlsearch "highlight search
else
	set nohlsearch
endif
set incsearch "highlight when typing command (not only after)
set backspace=2 "backspace
set noswapfile "no swap file
set noignorecase "no ignore case
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
			\exe "normal! g`\"" | endif "remember position in file

"help <leader>h
nmap <leader>h :exe "tabnew " . g:help_vim_file<CR>
"setting <leader>s
nmap <leader>s :exe "tabnew " . g:setting_vim_file<CR>
"""""""""""""""""""""""""""""""""""""basic function"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
"keep cursor place
let g:first_line_visible = line('w0') + g:min_number_line_ar_cur
let g:save_pos = getpos('.')
function! SetCursorPlaceSave()
	let g:first_line_visible = line('w0') + g:min_number_line_ar_cur
	let g:save_pos = getpos('.')
endfunction
function! SetCursorPlaceGo()
	exe ':' . g:first_line_visible
	:normal zt
	call setpos('.', g:save_pos)
endfunction

"open file under cursor <leader>of
nmap <leader>of :call TryOpenFileUnderCursorName()<CR>
function! TryOpenFileUnderCursorName()
	let filename_to_open = expand('<cword>')
	exe ':silent! b ' . filename_to_open
	exe ':silent! b ' . filename_to_open . '.c'
	exe ':silent! b ' . filename_to_open . '.h'
	exe ':silent! b ' . filename_to_open . '.cpp'
	exe ':silent! b ' . filename_to_open . '.vim'
	if !empty(glob(filename_to_open . '.c'))
		exe ':silent! e ' . filename_to_open . '.c'
	elseif !empty(glob(filename_to_open . '.h'))
		exe ':silent! e ' . filename_to_open . '.h'
	elseif !empty(glob(filename_to_open . '.cpp'))
		exe ':silent! e ' . filename_to_open . '.cpp'
	elseif !empty(glob(filename_to_open . '.vim'))
		exe ':silent! e ' . filename_to_open . '.vim'
	elseif !empty(glob(filename_to_open))
		exe ':silent! e ' . filename_to_open
	endif
endfunction

"invert sign (+ -, * /, ...) <C-d>
imap <C-d> <C-o>:call SergeInvertSign()<CR>
nmap <C-d> :call SergeInvertSign()<CR>
function! SergeInvertSign()
	let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if char_act == '+'
		:normal r-
	elseif char_act == '-'
		:normal r+
	elseif char_act == '|'
		:normal r&
	elseif char_act == '&'
		:normal r|
	elseif char_act == '<'
		:normal r>
	elseif char_act == '>'
		:normal r<
	elseif char_act == '='
		:normal r!
	elseif char_act == '!'
		:normal r=
	elseif char_act == '*'
		:normal r/
	elseif char_act == '/'
		:normal r*
	endif
	:silent normal l
endfunction
"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""copy/paste"""""""""""""""""""""""""""""""""
"copy
"	paste <leader>p
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"imap <leader>p <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>a
"	copy <leader>y
nmap <leader>y :.w !pbcopy<CR><CR>
vmap <leader>y :'<, '>w !pbcopy<CR><CR>
nmap <leader>d :. !pbcopy<CR><CR>
vmap <leader>d :'<, '> !pbcopy<CR><CR>
"	enable copy <leader>c
nmap <leader>c :!cat %<CR>
"""""""""""""""""""""""""""""""""""""copy/paste"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""save/quit""""""""""""""""""""""""""""""""""
"save and quit option
"create session <F5>
nmap <F5> :wa<CR>:mksession!<CR>
"create session and quit <leader><F5>
nmap <leader><F5> :wa<CR>:mksession!<CR>:wqa<CR>
"easy save
command! W w
command! WQ wq
command! Wq wq
command! WA wa
command! Wa wa
command! WQA wqa
command! WQa wqa
command! Wqa wqa
command! WqA wqa
command! XA xa
command! Xa xa
"""""""""""""""""""""""""""""""""""""save/quit""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""tab buffer"""""""""""""""""""""""""""""""""
"gest tab
"	tabmove next <leader> <tab>
nmap <leader><tab> :tabmove +1<CR>
nmap <leader><C-tab> :tabmove +1<CR>
"	tabmove last <leader> <S-tab>
nmap <leader><S-tab> :tabmove -1<CR>
nmap <leader><C-S-tab> :tabmove -1<CR>

"change buffer (<C-w> + up/down/right/left || hjkl)
"	right <C-w> l
nmap <C-w><right> <C-w>l
nmap <C-w><C-l> <C-w>l
map <C-l> <C-w>l
"	left <C-w> h
nmap <C-w><left> <C-w>h
nmap <C-w><C-h> <C-w>h
map <C-h> <C-w>h
"	up <C-w> k
nmap <C-w><up> <C-w>k
nmap <C-w><C-k> <C-w>k
map <C-k> <C-w>k
"	down <C-w> j
nmap <C-w><down> <C-w>j
nmap <C-w><C-j> <C-w>j
map <C-j> <C-w>j

"auto open in vertical split (left) <leader> f
"nmap <leader>f <C-w>f<C-w>L
"imap <leader>f <esc><C-w>f<C-w>Li
"""""""""""""""""""""""""""""""""""""tab buffer"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""Makefile"""""""""""""""""""""""""""""""""""
"make exec <F6> :MakeEx
command! MakeEx !make exec
command! Makeex !make exec
nmap <F6> :!make exec<CR>
"make re <leader><F6> :MakeRe
command! MakeRe !make re
command! Makere !make re
"other make
command! MakeRx !make reexec
nmap <leader><F6> :!make reexec<CR>
command! MakeCl !make clean
command! Makecl !make clean
command! MakeFc !make fclean
command! Makefc !make fclean
command! MakeNo !make norm
command! Makeno !make norm
command! Make !make
command! MakeAl !make
command! Makeal !make
"""""""""""""""""""""""""""""""""""""Makefile"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""other""""""""""""""""""""""""""""""""""""""
"mouse <leader>m m/a
"	disable <leader>mm
nmap <leader>mm :set mouse=<CR>
"	enable <leader>ma
nmap <leader>ma :set mouse=a<CR>
"enter in normal mode : go to insert mode then enter <CR>
"nmap <CR> i<CR>

"relative number : <F3>
nmap <F3> :set invrelativenumber<CR>
imap <F3> <esc>:set invrelativenumber<CR>

"cursor line <F4>
nmap <F4> :set invcursorline<CR>
imap <F4> <esc>:set invcursorline<CR>

"reload vimrc <leader>v
nmap <leader>v :so $MYVIMRC<CR>
nmap <leader><C-v> :so $MYVIMRC<CR>
nmap <leader>V <C-o>:so $MYVIMRC<CR>

"fast move of 5 char <S + dir>
"	fast move of 5 char right <S-right>
nmap <S-right> <right><right><right><right><right>
imap <S-right> <right><right><right><right><right>
"	fast move of 5 char left <S-left>
nmap <S-left> <left><left><left><left><left>
imap <S-left> <left><left><left><left><left>
"	fast move of 5 char up <S-up>
nmap <S-up> :-5<CR>
imap <S-up> <C-o>:-5<CR>
"	fast move of 5 char down <S-down>
nmap <S-down> :+5<CR>
imap <S-down> <C-o>:+5<CR>
"""""""""""""""""""""""""""""""""""""other""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""Ugo""""""""""""""""""""""""""""""""""""""""
command! Ugo echo 'pas normal'
command! Goinfre normal ggdG
command! Cleanstars %s/*//g
"""""""""""""""""""""""""""""""""""""Ugo""""""""""""""""""""""""""""""""""""""""
