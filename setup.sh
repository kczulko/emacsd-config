#!/usr/bin/env bash

CURRENT_DIR=$(dirname $(readlink -f $0))
EMACSD=~/.emacs.d

echo $CURRENT_DIR

rm -rf $EMACSD
mkdir -p $EMACSD
ln -sf $CURRENT_DIR/init.el $EMACSD
ln -sf $CURRENT_DIR/configs $EMACSD
ln -sf $CURRENT_DIR/my-snippets $EMACSD/my_snippets

