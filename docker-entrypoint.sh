#!/usr/bin/env bash
set -ex

# this if will check if the first argument is a flag
# but only works if all arguments require a hyphenated flag
# -v; -SL; -f arg; etc will work, but not arg1 arg2
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    exec gosu yocto /bin/bash
fi

# else default to run whatever the user wanted like "bash" or "sh"
exec "$@"