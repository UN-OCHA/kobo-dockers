#!/bin/bash

export PATH=$PATH:./node_modules/.bin

oldpwd=$(pwd)
cd /srv/src/koboform

echo "Collecting static files..."
source "$oldpwd/prepare_static_files.sh"
echo "Done"
echo "Fixing permissions..."
chown -R wsgi /srv/src/koboform
echo "Done."
echo "Syncing to nginx folder..."
rsync -aq  /srv/src/koboform/staticfiles/* /srv/static/
echo "Done"

cd $oldpwd
