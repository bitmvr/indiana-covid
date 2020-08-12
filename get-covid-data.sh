#!/usr/bin/env bash

source ./covid.conf

get_COVID_data(){
  curl -sL "$DATA_URL" -o "$DATA_FILE" > /dev/null 2>&1
}

if ! get_COVID_data; then
  exit 1
fi

