#!/bin/bash

TIMESTAMP=$(date +%d%m%Y_%H%M%S)


SOURCE_DIR="$HOME/atlas/backups"

TEMP_BACKUP="/tmp/atlas_backup_$TIMESTAMP.tar.gz"

S3_BUCKET="s3://atlas-edcloud-backups"

tar -czf $TEMP_BACKUP $SOURCE_DIR
