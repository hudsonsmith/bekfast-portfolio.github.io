#! /bin/bash

if [[ $1 ]]; then
    password="$1"
fi

# Encrypt the hub file with the password
npx pagecrypt ./src/hub.html ./docs/hub.html $password

# For game dir in games.
for game in $(ls ./games); do
    # If the game dir is found.
    if [[ -d ./games/$game ]]; then
        # If the encrypted game dir doesn't exist, create it.
        if [[ ! -d ./docs/games/$game ]]; then
            mkdir ./docs/games/$game
            echo "Creating directory under ./docs/games/$game"
        fi

        # Clear the encrypted game dir.
        rm -rf ./docs/games/$game/*

        # Then re-add all the files.
        cp -r ./games/$game/* ./docs/games/$game/

        # Finally, encrypt the file using pagecrypt.
        npx pagecrypt ./games/$game/index.html ./docs/games/$game/index.html $password
    fi
done