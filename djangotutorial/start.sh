#! /usr/bin/bash 

set -e # Exit on any error 

# Make sure the data directory exists. This silences an ugly error but isn't
# strictly necessary. 
mkdir -p $DATA_DIR 

if ! python manage.py migrate --check; then 
    echo Setting up Django for the first time. 
    python manage.py migrate
    python manage.py createsuperuser --noinput \
            --username $DJANGO_SUPERUSER_NAME \
            --email $DJANGO_SUPERUSER_EMAIL 
else
    echo "Django has been setup."
fi

python manage.py runserver 0.0.0.0:$PORT