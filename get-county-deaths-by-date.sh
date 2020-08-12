#!/usr/bin/env bash

source ./covid.conf

getDeathsByDate(){
  local county="$1"
  local date="$2"
  jq ".objects.cb_2015_indiana_county_20m.geometries[].properties | select(.NAME==\"${county}\") | .VIZ_DATE[] | select(.DATE==\"${date}\") | .COVID_COUNT" "$DATA_FILE"
}

if [ $# -eq 0 ]; then
  echo "Missing arguments. Please pass a county name (i.e. Marion) and a date as (YYYY-MM-DD)."
  exit 1
fi


getDeathsByDate "$1" "$2"

