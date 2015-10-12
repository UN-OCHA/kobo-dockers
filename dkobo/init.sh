#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/koboform

#npm install -g --save-dev
#npm install -g bower --allow-root
#bower install --config.interactive=false --allow-root

python manage.py syncdb --noinput

python manage.py migrate --noinput

cd $oldpwd
