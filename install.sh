#!/bin/bash

set -e

export PLUGIN_PATH="${HOME}/.local/share/nvim/site/pack/plugins/start"
export NVIM_CONFIG="${HOME}/.config/nvim"
export GIT_CLONE="git clone --depth=1"

# backup nvim config if existed
if [ -d ${NVIM_CONFIG} ]; then
  mv ${NVIM_CONFIG} "${NVIM_CONFIG}.bak"
fi

# install nvchad
${GIT_CLONE} https://github.com/NvChad/NvChad "${HOME}/.config/nvim"

# terraform autoformatting
${GIT_CLONE} https://github.com/hashivim/vim-terraform.git ${PLUGIN_PATH}/vim-terraform

# vim-go autoformatting and documentation helpers
${GIT_CLONE} https://github.com/fatih/vim-go.git ${PLUGIN_PATH}/vim-go

# syntax highlighting for the most filetypes, neovim missed Jenkinsfile highlighting
${GIT_CLONE} https://github.com/sheerun/vim-polyglot.git ${PLUGIN_PATH}/vim-polyglot

rsync -av ./custom/ "${HOME}/.config/nvim/lua/custom/"
