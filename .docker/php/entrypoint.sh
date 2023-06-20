#!/bin/bash

composer install

/usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisor.conf