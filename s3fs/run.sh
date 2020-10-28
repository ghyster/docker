#!/bin/sh

set -e

echo "$AWS_KEY:$AWS_SECRET_KEY" > passwd && chmod 600 passwd
s3fs "$S3_BUCKET" "$MNT_POINT" -o passwd_file=passwd -o use_path_request_style -o endpoint=fr-par -o parallel_count=15 -o multipart_size=128 -o nocopyapi -o url=https://s3.fr-par.scw.cloud && tail -f /dev/null
