#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/kobocat

echo "Collecting static files..."
python manage.py collectstatic -v 0 -c --noinput 
echo "Done"
echo "Fixing permissions..."
chown -R wsgi /srv/src/kobocat
echo "Done."
echo "Syncing to nginx folder..."
rsync -aq /srv/src/kobocat/onadata/static/* /srv/static/
echo "Done"

cd $oldpwd
