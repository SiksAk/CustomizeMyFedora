#!/bin/sh

# Powerline
sudo pip install powerline-status
POWERLINE_INSTALL_PATH=`pip show powerline-status | grep Location | cut -d' ' -f2`
cat >> ~/.bashrc << EOF
. $POWERLINE_INSTALL_PATH/powerline/bindings/bash/powerline.sh
EOF

. $POWERLINE_INSTALL_PATH/powerline/bindings/bash/powerline.sh

# Font
git clone https://github.com/powerline/fonts.git
cd fonts && ./install.sh

# vim
cat >> ~/.vimrc << EOF
set rtp+=$POWERLINE_INSTALL_PATH/powerline/bindings/vim

set nocompatible
set t_Co=256

let g:minBufExplForceSyntaxEnable=1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen-0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode

EOF
