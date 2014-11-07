#!/bin/sh

if [ $1 ]; then
	mkdir $1 &&
	cd $1 &&
	cp $HOME/Rendu/Makefile . &&
	cp -r $HOME/Rendu/libft . &&
	mkdir includes &&
	touch includes/$1.h &&
	mkdir srcs &&
	touch srcs/main.c
else
	echo "Usage : proj_c [PojectName]"
fi