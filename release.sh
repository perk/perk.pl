#!/bin/sh
set -euo pipefail
IFS=$'\n\t'


echo "Building site with hugo"
hugo
