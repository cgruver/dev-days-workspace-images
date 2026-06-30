#!/usr/bin/env bash
set -e
npm install -g @kilocode/cli

cat << EOF >> /workspace-init.sh
if [ -f /globalconfig/kilo.jsonc ]
then
  mkdir -p ${HOME}/.config/kilo
  cp /globalconfig/kilo.jsonc /etc/opencode/kilo.jsonc
  sed -i "s|_LLM_BASE_URL_|\${LLM_BASE_URL}|g" /etc/opencode/kilo.jsonc
  sed -i "s|_LLM_API_KEY_|\${LLM_API_KEY}|g" /etc/opencode/kilo.jsonc
fi
EOF
