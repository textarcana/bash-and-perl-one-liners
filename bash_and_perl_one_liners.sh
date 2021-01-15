#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

echo "DO NOT RUN THIS FILE! The examples in it are meant to be read"
echo "carefully and then copied piecemeal as needed"
exit 1

awk '!seen[$0]++' .bash_history > uniq-history # remove duplicate lines in bash history without sorting

tree -dl -L 5 /opt/data # show the skeleton of a filesystem
