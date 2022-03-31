#!/bin/bash -e

albumpath="$1"

# Escape any problematic character
encoded="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$albumpath")"

# scraping AlbumArt.org
url="http://www.albumart.org/index.php?searchk=$encoded&itempage=1&newsearch=1&searchindex=Music"

# Grab the first Amazon image without an underscore (usually the largest version)
coverurl=`wget -qO - "$url" | grep -m 1 -o 'http://ecx.images-amazon.com/images/I/*/[%0-9a-zA-Z.,-]*.jpg'`

echo "$coverurl"
