#!/bin/bash

export PERLBREW_ROOT=/home/ubuntu/perl5/perlbrew
source ${PERLBREW_ROOT}/etc/bashrc

fuser 8200/tcp -k
sleep 2

cd /www/aware/pi/web

starman  -l :8200  --workers 5 --preload-app --error-log /www/aware/pi/web/web.error.log --daemonize webpi.psgi

