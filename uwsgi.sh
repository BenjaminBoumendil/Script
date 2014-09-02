#!/bin/sh

project=`pwd | cut -d/ -f4`

if [ $1 ] && [ $project ]; then
    if [ $1 = 'start' ]; then
        /home/ben/$project/bin/uwsgi /home/ben/$project/parts/uwsgi/uwsgi.xml
    elif [ $1 = 'stop' ]; then
        /bin/bash -c 'kill -INT `/bin/cat /home/ben/'$project'/var/uwsgi.pid`'
    fi
else
    echo "arg1 : 
    start : to start uwsgi
    stop : to stop uwsgi
arg2 : 
    Project name"
fi