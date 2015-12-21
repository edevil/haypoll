#!/usr/bin/env bash

function test_postgresql {
  pg_isready -h "${DB_HOST}" -U "postgres"
}

count=0
# Chain tests together by using &&
until ( test_postgresql )
do
  ((count++))
  if [ ${count} -gt 50 ]
  then
    echo "Services didn't become ready in time"
    exit 1
  fi
  sleep 1
done
