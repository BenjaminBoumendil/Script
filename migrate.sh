#!/bin/sh

if [ $1 ]; then
    if [ $2 = 'init' ]; then
    	bin/django-instance schemamigration $1 --initial
    	bin/django-instance migrate $1
    elif [ $2 = 'fake' ]; then
        bin/django-instance migrate $1 --fake
    else
    	bin/django-instance schemamigration $1 --auto
    	bin/django-instance migrate $1
    fi
else
    echo "Usage : migr [AppName] [option]

options : 
    init : for initial migration
    fake : for fake migration"
fi