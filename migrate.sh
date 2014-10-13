#!/bin/sh

ft_column_rename()
{
    if [ $3 ]; then
        django-instance schemamigration $1 renaming_column_$3 --auto &&
        echo "manually edit the migration file to look like this :
db.rename_column(u'myapp_mymodel', 'old_column_name', 'new_column_name')"
    else
        echo "Usage : migr [AppName] [option] [ColumnName]"
    fi
}

if [ $1 ]; then
    case $2 in 
        'init')     bin/django-instance schemamigration $1 --initial
                    bin/django-instance migrate $1 ;;
        'fake')     bin/django-instance migrate $1 --fake ;;
        'update')   bin/django-instance schemamigration $1 --auto --update ;;
        'ghost')    django-instance migrate $1 --delete-ghost-migrations ;;
        'list')     django-instance migrate $1 --list ;;
        'merge')    django-instance migrate $1 --merge ;;
        'rename')   ft_column_rename ;;
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
    list : list all migration
    merge : merge all migration
    rename : rename a column"
fi