#!/bin/sh

set -e

python manage.py wait_for_db
python manage.py collectstatic --noinput
python manage.py migrate

# uwsgi --bind :9000 --workers 4 --master --enable-threads --module app.wsgi
gunicorn --bind :9000 --workers 4 app.wsgi