#!/bin/bash

# Constants
SOURCE="none"
TARGNAME="none"

# Variables for collecting flags
COPY=0

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -c|--copy)
            COPY=1
            ;;
        *)  # Process file name and target name
            if [ $SOURCE == "none" ]; then
                SOURCE=$arg
            elif [ $TARGNAME == "none" ]; then
                TARGNAME=$arg
            fi
    esac
done

# Append date to target file name
DIR="${HOME}/stack/jrnl/logfigures"
DATE=`date +%Y%m%d`
NAME="${TARGNAME%.*}"
EXTENSION="${TARGNAME##*.}"
TARGET="${DIR}/${TARGNAME}-${DATE}.${EXTENSION}"

# Processing
if [ $COPY == 0 ]; then
    `mv $SOURCE $TARGET`
elif [ $COPY == 1 ]; then
    `cp $SOURCE $TARGET`
fi

