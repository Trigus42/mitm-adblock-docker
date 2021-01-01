#!/bin/bash
echo "Build date: $(cat /build-date.txt)"

cd /etc/mitm-adblock/
./update-blocklists
./go