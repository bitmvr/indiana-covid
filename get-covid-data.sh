#!/usr/bin/env bash

# For the national data, add NULL_FIELD to 'empty' columns so that the cut is performed correctly
# sed -i -- "s/,,/,NULL_FIELD,/g" ts-covid-us-null-filled.csv
# cat ./ts-covid-us.csv | cut -d ',' -f6-7,12- > ./filtered.csv

#readonly DATA_FILE="./daily.json"
#readonly DATA_URL="https://www.coronavirus.in.gov/map/covid-19-indiana-daily-report-current.topojson"

source ./covid.conf

get_COVID_data(){
  curl -sL "$DATA_URL" -o "$DATA_FILE"
}

if ! get_COVID_data; then
  echo "Could not download ${DATA_URL}"
  exit 1
fi

