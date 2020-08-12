#!/usr/bin/env bash

source ./covid.conf

get_COVID_data(){
  curl -sL "$DATA_URL" -o "$DATA_FILE"
}

if ! get_COVID_data; then
  echo "Could not download ${DATA_URL}"
  exit 1
fi

