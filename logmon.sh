#!/bin/bash
cd "$(dirname "$0")"

[ $# -eq 0 ] && tail -F -n1 logs/latest.log | xargs -n1 -d '\n' ./logmon.sh
[[ "$1" =~ "[Server thread/" ]] && [[ ! "$1" =~ "/INFO]:" ]] && [[ ! "$1" =~ "]: Fetching" ]] && [[ ! "$1" =~ "]: Mismatch" ]] && [[ ! "$1" =~ "]: Ambiguity" ]] && ./pushover.sh "$1"
