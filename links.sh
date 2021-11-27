#!/bin/bash

# URL swap might be causing this
# https://michaelcurrin.github.io/404.html

# --url-swap '\/code-cookbook/:/' \

#'https:\/\/github.com\/MichaelCurrin\/code-cookbook

# subpath

# Internal for metadata which is always absolute. So replace with local /.
# Note that other github.io links need to be checked still

# writing errors as 2> is useful for log output
# and in the case of bad flags, useful info is sent to both stdout and stderror.

# How to fix for baseurl. Unrelated to prod mode.

# why does https://github.com/MichaelCurrin fail
# This doesn't seem reliable overall as the number of failures changes each time. Maybe because of forced parallel use?
set -e

cd _site

htmlproofer . \
  --external-only
#\
#2>~/Documents/proof/code-cookbook-3.log

# --assume-extension \
#   --url-swap '^\/code-cookbook/:/,https:\/\/michaelcurrin.github.io\/code-cookbook/:/' \
#   --url-ignore 'http:\/\/localhost\:4000,/edit/,/new/' \

# https:\/\/github.com\/MichaelCurrin

# what about against remote site rather?
