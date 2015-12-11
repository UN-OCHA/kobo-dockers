#!/bin/bash

export PATH=$PATH:./node_modules/.bin

oldpwd=$(pwd)
cd /srv/src/koboform

python manage.py syncdb --noinput

python manage.py migrate --noinput

source "$oldpwd/prepare_static_files.sh"

cd $oldpwd
