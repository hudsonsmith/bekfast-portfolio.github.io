#! /bin/bash

# A script to serve the site after encrypting (for tests).

if [[ $1 ]]; then
    password="$1"

    ./scripts/encrypt.sh $password
    cd ./docs
    python3 -m http.server
    exit
fi

echo "Please provide an encryption password!"

