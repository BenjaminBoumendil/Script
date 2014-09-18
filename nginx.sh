#!/bin/sh

if [ $1 ]; then
    if [ $1 = 'start' ]; then
        sudo service nginx start
    elif [ $1 = 'stop' ]; then
        sudo service nginx stop
    elif [ $1 = 'reload' ]; then
        sudo service nginx reload
    elif [ $1 = 'status' ]; then
        sudo service nginx status
    fi
else
    echo "Usage : mynginx [option]

Options :
    start : to start nginx
    stop : to stop nginx
    reload : to reload nginx
    status : to get nginx status"
fi
