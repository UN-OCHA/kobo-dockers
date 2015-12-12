#!/bin/bash

########################################################
## Common commands used by init.sh and sync_static.sh ##
########################################################

mkdir -p /srv/src/koboform/staticfiles

python manage.py collectstatic --noinput -c -v 0
grunt build_all
#npm install yuglify
python manage.py compress
mkdir -p jsapp/CACHE
cp -R jsapp/components/fontawesome/fonts jsapp/CACHE/fonts
python manage.py collectstatic --noinput -v 0
