#!/bin/bash
ACTIVE=$(i3-msg -t get_workspaces|tr '{' '\n'|grep 'focused":true'|cut -f2 -d':'|cut -f1 -d',')
i3-msg focus output left
i3-msg move workspace to output left
i3-msg workspace $ACTIVE
i3-msg move workspace to output left
