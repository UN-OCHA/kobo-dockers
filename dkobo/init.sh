#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/koboform

bower install --config.interactive=false --allow-root

python manage.py syncdb --noinput

python manage.py migrate --noinput

cd $oldpwd
