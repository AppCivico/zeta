#!/bin/bash

export PERLBREW_ROOT=/home/ubuntu/perl5/perlbrew
source ${PERLBREW_ROOT}/etc/bashrc

fuser 8100/tcp -k
sleep 2

cd /www/aware/pi/api

starman  -l :8100  --workers 5 --preload-app --error-log /www/aware/pi/api.error.log --daemonize pi.psgi

