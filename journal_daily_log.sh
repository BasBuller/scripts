#!/bin/bash

ROOT="$HOME/stack/jrnl/"
FIGROOT="${ROOT}/logfigures/"
FILE="${ROOT}daily.md"
BACKUP="${ROOT}backup.md"

# Backup file of yesterday, remove old backups
if [ -f "$FILE" ]; then
    mv "$FILE" "$BACKUP"
fi

# Start code at existing workspace
code \
    --wait \
    --enable-proposed-api "markdown-preview-enhanced.openPreviewToTheSide" \
    "${ROOT}daily_log.code-workspace" \
    "${FILE}"

# Pipe new file to journal
if [ -f "$FILE" ]; then
    source ~/anaconda3/etc/profile.d/conda.sh
    conda activate journal
    jrnl daily_work_log < "${FILE}"
else
    echo "Did not save anything to journal"
fi

