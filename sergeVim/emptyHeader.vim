" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    emptyHeader.vim                                    :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 22:43:54 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/09 18:47:45 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""emptyHeader""""""""""""""""""""""""""""""""
"create a empty header :SergeEmptyHeader
command! SergeEmptyHeader exe ':call CreateEmptyHeader()'
function! CreateEmptyHeader()
	call SetCursorPlaceSave()
	let line_before = line('.')
	let user = $USER
	let mail = $MAIL
	let begin = '# '
	let end = ' #'
	let size_c = 1
	if expand('%:e') == 'c' || expand('%:e') == 'h' || expand('%:e') == 'cpp'
		let begin = '\/\*'
		let end = '\*\/'
		let size_c = 2
	elseif expand('%:e') == 'vim' || expand('%:t') == '.vimrc'
		let begin = '" '
		let end = ' "'
		let size_c = 1
	elseif expand('%:t') == '.emacs'
		let begin = '; '
		let end = ' ;'
		let size_c = 1
	endif
	"expand for srcs/main.c
	"	%:t main.c
	"	%:e c
	"	%:r srcs/main.c
	"	%:r:t srcs/main
	let filename = expand('%:t')
	let time_act = strftime('%Y\/%m\/%d %H:%M:%S')
	if user == '' || user == 'tim'
		let user = g:username42
	endif
	if mail == ''
		let mail = g:mail42
	endif
	let line_s = line_before + 1
	if line_s > line('$')
		let line_s = line('$')
	endif
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r'
	call SetCursorPlaceGo()
endfunction
"""""""""""""""""""""""""""""""""""""emptyHeader""""""""""""""""""""""""""""""""
