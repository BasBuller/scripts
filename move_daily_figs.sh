#!/bin/bash

# Constants
DIR="${HOME}/stack/jrnl/logfigures/"
DATE=`date +%Y%m%d`

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
    esac
done

# Processing
if [ $COPY == 0 ]; then
    echo "Moving..."
elif [ $COPY == 1 ]; then
    echo "Copying..."
fi

