#!/bin/bash

copy2() {
    echo "# Copy '$1' to '$2'"
    scp -r "$1" "$2"
    scp setup.* "$2/sunsynk/"
    scp README.md "$2/sunsynk/"
    scp -r sunsynk "$2/sunsynk/sunsynk/"
    scp Dockerfile "$2/Dockerfile"

    #echo "# Modify Dockerfile"
    #cp "$1/Dockerfile" Dockerfile.tmp
    #sed -i '/sunsynk/d' Dockerfile.tmp
    #grep sunsynk Dockerfile.tmp
    #sed -i 's/# RUN pip3 install -e/RUN pip3 install -e/' Dockerfile.tmp
    #scp Dockerfile.tmp "$2/Dockerfile"
    #rm Dockerfile.tmp

    cp "$1/config.yaml" config.tmp
    sed -i 's/name: /name: LOCAL /' config.tmp
    scp config.tmp "$2/config.yaml"
    rm config.tmp
}

copy2 "hass-addon-sunsynk-multi" "root@192.168.88.27:/addons/hass-addon-sunsynk-multi"

exit 0