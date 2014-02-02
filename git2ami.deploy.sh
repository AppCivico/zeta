#!/bin/bash

# Perlbrew
curl -L http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc
perlbrew install perl-5.16.1 -n -j 3
perlbrew switch perl-5.16.1
perlbrew install-cpanm
curl -L http://cpanmin.us | perl - --self-upgrade

# Install Perl deps
cpanm -n Module::Install::Catalyst Module::Install

(cd pi/api && perl Makefile.PL --skipdeps)
(cd pi/api && cpanm --installdeps . -n)

(cd pi/web && perl Makefile.PL --skipdeps)
(cd pi/web && cpanm --installdeps . -n)

# Put in Makefile.PL
# api
cpanm -n Redis XML::LibXML::Simple String::Util
# web
cpanm -n Catalyst::Controller::ActionRole

# TODO
# CONFIG NGINX
# INIT SCRIPTS

