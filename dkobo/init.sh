#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/koboform

#npm install -g --save-dev
#npm install -g bower --allow-root
#bower install --config.interactive=false --allow-root

python manage.py syncdb --noinput

python manage.py migrate --noinput

python manage.py collectstatic --noinput -c -v 0
#--settings=dkobo.settings
grunt build_all
npm install yuglify
python manage.py compress
# --settings=dkobo.settings
mkdir -p jsapp/CACHE
cp -R jsapp/components/fontawesome/fonts jsapp/CACHE/fonts
python manage.py collectstatic --noinput -v 0
# --settings=dkobo.settings


cd $oldpwd
