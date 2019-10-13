#!/bin/bash

RELEASE=$1
BUILD_DATE=$(date +'%Y-%m-%d')

if [[ -d "dead-drop" ]]; then
    cd dead-drop
    git checkout master
    git pull
    cd ..
else
    git clone https://github.com/hymnis/dead-drop-python.git dead-drop
fi

docker build --build-arg RELEASE=$RELEASE --build-arg BUILD_DATE=$BUILD_DATE --no-cache -t hymnis/dead-drop:latest -t hymnis/dead-drop:$RELEASE .
