#!/bin/sh

case $1 in
    'start')    sudo service nginx start ;;
    'stop')     sudo service nginx stop ;;
    'reload')   sudo service nginx reload ;;
    'status')   sudo service nginx status ;;
    *)          echo "Usage : mynginx [option]

Options :
    start : to start nginx
    stop : to stop nginx
    reload : to reload nginx
    status : to get nginx status"
esac
