# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_git.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:20:33 by tnicolas          #+#    #+#              #
#    Updated: 2017/11/26 16:10:05 by tnicolas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
echo "\x1b[35m"
cat sergeheader
echo "\x1b[0m"
echo "update git repository"
mkdir -p ~/.vim-backup
cp -r sergeVim ~/.vim_backup
cp vimrc ~/.vimrc_backup
cp ~/.vimrc vimrc
if [ "$1" == "--param" ]; then
	cp -r ~/.vim/sergeVim .
else
	cp -r `find ~/.vim/sergeVim \( -iname "*" -a -not -iname "*param*" \) | grep "sergeVim/"` sergeVim
fi
git add -A
git commit -m "update git repository"
git push
