#!/bin/bash
if [[ -z $5 ]]; then
    return
fi

site=$(curl --silent --user $3:$4 "$2/search.php?query=$5"|grep class=\"el\"|head -n 1|cut -d'"' -f 6)
echo "Found: $site"
nohup $1 $2/$site &
