#!/usr/bin/env bash

source "$(dirname $0)/base.sh"

docker run --rm -it -v ${BUILDIR}:/qmk_firmware qmkfm/qmk_firmware make lets_split/rev2:${KEYMAP}
