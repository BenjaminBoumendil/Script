#!/bin/sh

if [ $1 ]; then
    if [ $2 = 'init' ]; then
        bin/django-instance schemamigration $1 --initial
        bin/django-instance migrate $1
    elif [ $2 = 'fake' ]; then
        bin/django-instance migrate $1 --fake
    elif [ $2 = 'update' ]; then
        bin/django-instance schemamigration $1 --auto --update
    elif [ $2 = 'ghost' ]; then
        django-instance migrate $1 --delete-ghost-migrations
    elif[ $2 = 'list' ]; then
        django-instance migrate $1 --list
    else
        bin/django-instance schemamigration $1 --auto
        bin/django-instance migrate $1
    fi
else
    echo "Usage : migr [AppName] [option]

options : 
    init : for initial migration
    fake : fake migration
    update : update last migration
    ghost : delete ghost migration
    list : list all migration"
fi