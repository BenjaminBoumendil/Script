#!/bin/sh

if [ $1 ]; then
    case $2 in 
        'init')     bin/django-instance schemamigration $1 --initial
                    bin/django-instance migrate $1 ;;
        'fake')     bin/django-instance migrate $1 --fake ;;
        'update')   bin/django-instance schemamigration $1 --auto --update ;;
        'ghost')    django-instance migrate $1 --delete-ghost-migrations ;;
        'list')     django-instance migrate $1 --list ;;
        *)          bin/django-instance schemamigration $1 --auto
                    bin/django-instance migrate $1 ;;
    esac
else
    echo "Usage : migr [AppName] [option]

options : 
    init : for initial migration
    fake : fake migration
    update : update last migration
    ghost : delete ghost migration
    list : list all migration"
fi