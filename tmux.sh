#!/bin/sh

#$INSTALL_CMD tmux

cd
rm -rf .tmux*
git clone https://github.com/gpakosz/.tmux.git
ln -s .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
