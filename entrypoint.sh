#!/usr/bin/env bash
set -e

envToAdd=`python /opt/esp-idf/tools/idf_tools.py --non-interactive export`
eval $envToAdd
exec "$@"