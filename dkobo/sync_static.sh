#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/koboform

echo "Collecting static files..."
python manage.py collectstatic -v 0 -c --noinput 
echo "Done"
echo "Fixing permissions..."
chown -R wsgi /srv/src/koboform
echo "Done."
echo "Syncing to nginx folder..."
rsync -aq  /srv/src/koboform/staticfiles/* /srv/static/
echo "Done"

cd $oldpwd
