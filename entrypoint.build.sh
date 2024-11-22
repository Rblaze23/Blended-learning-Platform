#!/bin/bash

set -e

echo -e "Running $DJANGO_ENV Env\n*****************\n"

run_migration () {
  if [[ $DJANGO_RUN_MIGRATION = "on" ]]; then
    echo -e "Run migrations : Start \n"
    exec python3 src/manage.py migrate&
    wait $!
    echo -e "Run migrations : Done \n"
    #exit 0
  fi
}

echo -e "Start background process to run migrations"
run_migration  &

echo -e "Starting production server\n************\n"
exec supervisord -c /supervisor/supervisor.conf
