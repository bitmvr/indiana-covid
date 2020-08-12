#!/usr/bin/env bash

readonly COUNTY_NAME="$1"
readonly DAYS_AGO="$2"

_todays_date(){
  date +"%Y-%m-%d"
}

_start_date(){
  local days_ago
  days_ago="$DAYS_AGO"
  todays_date="$(_todays_date)"
  date -j -f %Y-%m-%d -v-"$days_ago"d "$todays_date" +%Y-%m-%d
}

_increase_date(){
  local i_date
  i_date="$1"
  date -j -f %Y-%m-%d -v+1d "${i_date}" +%Y-%m-%d
}

main(){
  local county_name
  local i_date
  local todays_date
  i_date="$(_start_date)"
  todays_date="$(_todays_date)"
  county_name="$COUNTY_NAME"
 
  until [ "$i_date" == "$todays_date"  ]; do
    covid_count="$(./get-county-deaths-by-date.sh "$county_name" "$i_date")"
    echo "${county_name},${i_date},${covid_count}"
    i_date="$(_increase_date "$i_date")"
  done

  # TODO
  # Provide total using awk command below:
  #   awk -F ',' '{ SUM += $3} END { print SUM }'
}

if [ $# -eq 0 ]; then
  echo "Please pass the target county name (i.e. Marion) and how many days ago (i.e. 14)"
  exit 1
fi

main "$1" "$2"

