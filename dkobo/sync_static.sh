#!/bin/bash

oldpwd=$(pwd)
cd /srv/src/kobocat

echo "Collecting static files..."
python manage.py collectstatic -v 0 -c --noinput 
echo "Done"
echo "Fixing permissions..."
chown -R wsgi /srv/srv/koboform
echo "Done."
echo "Syncing to nginx folder..."
rsync -aq rsync -av /srv/src/koboform/staticfiles/* /srv/stat
echo "Done"

cd $oldpwd
