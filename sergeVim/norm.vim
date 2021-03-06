" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    norm.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:57:46 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/08 23:25:22 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""norm"""""""""""""""""""""""""""""""""""""""
"norm
"	norm in the file :WW
command! WW !echo "--------------------------------------------------------"
			\&& norminette % &&
			\echo "--------------------------------------------------------"<CR>
command! Ww !echo "--------------------------------------------------------"
			\&& norminette % &&
			\echo "--------------------------------------------------------"<CR>

"	make norm in the file <leader>nn :Norm
nmap <leader>nn :call NormFile()<CR>
command! SergeNorm exe ':call NormFile()'
function! NormFile()
	call SetCursorPlaceSave()
	let i = 0
	let max = 15
	:normal gg=G
	:call Create42Header()
	"remove space beetween () ex : ( ( = ((
	while i < max
		let i += 1
		:silent! 12, $ s/(\s\+(/((/g
		:silent! 12, $ s/)\s\+)/))/g
	endwhile
	"remove extra whitespaces (end of lines)
	:silent! 12, $ s/\s\+\n/\r/g
	"remove extra whitespaces (arround = & +...)
	"	test extra whitespace before and after =
	:silent! 12, $ s/\s\s\+=/ =/g
	:silent! 12, $ s/=\s\s\+/= /g
	"	test extra whitespace before and after +
	:silent! 12, $ s/\s\s\++/ +/g
	:silent! 12, $ s/+\s\s\+/+ /g
	"	test extra whitespace before and after -
	:silent! 12, $ s/\s\s\+-/ -/g
	:silent! 12, $ s/-\s\s\+/- /g
	"	test extra whitespace before and after <
	:silent! 12, $ s/\s\s\+</ </g
	:silent! 12, $ s/<\s\s\+/< /g
	"	test extra whitespace before and after >
	:silent! 12, $ s/\s\s\+>/ >/g
	:silent! 12, $ s/>\s\s\+/> /g
	"	test extra whitespace before and after !
	:silent! 12, $ s/\s\s\+\!/ \!/g
	"	test extra whitespace word(
	:silent! 12, $ s/\w\zs\s\+\ze(//g
	"	test extra whitespace if (
	:silent! 12, $ s/if(/if (/g
	:silent! 12, $ s/if\s\s\+(/if (/g
	"	test extra whitespace while (
	:silent! 12, $ s/while(/while (/g
	:silent! 12, $ s/while\s\s\+(/while (/g
	"	remove space before ;
	:silent! 12, $ s/\s\+;/;/g
	"	test extra whitespace return ( and return ;
	:silent! 12, $ s/return(/return (/g
	:silent! 12, $ s/return\s\s\+(/return (/g
	:silent! 12, $ s/return;/return ;/g
	:silent! 12, $ s/return\s\s\+;/return ;/g
	"	test extra whitespace break ;
	:silent! 12, $ s/break;/break ;/g
	:silent! 12, $ s/break\s\s\+;/break ;/g
	"	test extra whitespace around ( ) and [ ]
	:silent! 12, $ s/.\zs\s\+\ze[)\]]//g
	:silent! 12, $ s/[(\[]\zs\s\+\ze.//g
	:silent! 12, $ s/\w\zs\s\+\ze\[//g
	"	test extra whitespaces around ,
	:silent! 12, $ s/.\zs\s\+\ze,//g
	:silent! 12, $ s/,\zs\s\+\ze\n//g
	:silent! 12, $ s/,\s\zs\s\+\ze.//g
	:silent! 12, $ s/,\zs\ze\w/ /g
	"	test multiligne empty
	let i = 0
	while i < max
		let i += 1
		:silent! 12, $ s/^\n^\n/\r/g
	endwhile
	:normal gg=G
	call SetCursorPlaceGo()
endfunction
"""""""""""""""""""""""""""""""""""""norm"""""""""""""""""""""""""""""""""""""""
