#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

echo "DO NOT RUN THIS FILE! The examples in it are meant to be read"
echo "carefully and then copied piecemeal as needed"
exit 1

awk '!seen[$0]++' .bash_history > uniq-history # remove duplicate lines in bash history without sorting

# Show the skeleton of a filesystem down to 5 levels deep. -l means follow symlinks.

tree -dl -L 5 '/opt/data'

# Convert a UTC date to the East Coast US time zone. Note the strftime / format
# string "%FT%T%Z", which makes dateutils(1) print ISO-8601
# formatted date strings.

date -u --iso-8601=s | dconv --zone America/New_York -f "%FT%T%Z"

# Clean up output from Google Sheets - remove all control characters
# except for newlines. Then convert the CSV to JSON.

 mlr --c2j cat file.csv | tr '\r\n' '\275\276' | tr -d "[:cntrl:]" | tr "\275\276" "\r\n" | jq -c . > file.json
