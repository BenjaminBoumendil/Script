#!/bin/sh

if [ $1 ]; then
	django-instance runserver 127.0.0.1:800$1
else
	django-instance runserver
fi