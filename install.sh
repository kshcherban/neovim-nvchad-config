#!/bin/bash

set -eu

export NVIM_CONFIG="${HOME}/.config/nvim"

# NvChad v2.5

# backup nvim config if existed
if [ -d ${NVIM_CONFIG} ]; then
  mv ${NVIM_CONFIG} "${NVIM_CONFIG}.bak"
fi

rm -rf "${HOME}/.local/share/nvim"
rsync --delete -av ./nvim/ "${NVIM_CONFIG}/"
