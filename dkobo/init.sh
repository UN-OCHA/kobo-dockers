#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/koboform

python manage.py syncdb --noinput

python manage.py migrate --noinput

python manage.py collectstatic --noinput -c -v 0
grunt build_all
#npm install yuglify
python manage.py compress
mkdir -p jsapp/CACHE
cp -R jsapp/components/fontawesome/fonts jsapp/CACHE/fonts
python manage.py collectstatic --noinput -v 0

cd $oldpwd
