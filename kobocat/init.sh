#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/kobocat

python manage.py syncdb --noinput

python manage.py migrate --noinput

cd $oldpwd
