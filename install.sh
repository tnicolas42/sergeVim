# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 19:09:39 by tnicolas          #+#    #+#              #
#    Updated: 2017/12/15 00:04:59 by tnicolas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                      __      ___                             #
#                                      \ \    / (_)                            #
#                 ___  ___ _ __ __ _  __\ \  / / _ _ __ ___                    #
#                / __|/ _ \ '__/ _` |/ _ \ \/ / | | '_ ` _ \                   #
#                \__ \  __/ | | (_| |  __/\  /  | | | | | | |                  #
#                |___/\___|_|  \__, |\___| \/   |_|_| |_| |_|                  #
#                               __/ |                                          #
#                              |___/                                           #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
echo "\x1b[32m"
cat sergeHeader
echo "\x1b[0m"
cp ~/.vimrc ~/.vimrc_old_config
cp vimrc ~/.vimrc
if [ -d "~/.vim" ]; then
	rm -rf ~/.vim
fi
mkdir -p ~/.vim
cp -r sergeVim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
touch ~/.vim/sergePwd.vim
echo "let g:pwdGitSergeVim='"`pwd`"'" > ~/.vim/sergePwd.vim
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+SergeAlias' '+q'
