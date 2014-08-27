#!/bin/sh

if [ $1 ] && [ $2 = 'init' ]; then
	bin/django-instance schemamigration $1 --initial
	bin/django-instance migrate $1
elif [ $1 ]; then
	bin/django-instance schemamigration $1 --auto
	bin/django-instance migrate $1
fi