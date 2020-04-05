#!/bin/bash
set -e

export PATH=/opt/esp/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin:/opt/esp/tools/esp32ulp-elf/2.28.51.20170517/esp32ulp-elf-binutils/bin:/opt/esp/tools/openocd-esp32/v0.10.0-esp32-20190313/openocd-esp32/bin:/opt/esp/python_env/idf4.0_py3.6_env/bin:$PATH

exec "$@"
