#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
MODE=$(jq --raw-output '.mode // empty' $CONFIG_PATH)
LOG=$(jq --raw-output '.log // empty' $CONFIG_PATH)

echo "--- VERSIONS ---"
echo "App version: 0.6.3"
echo -n "neolink version: " && neolink --version
echo "neolink mode: ${MODE}"
echo "neolink log: ${LOG}"
echo "--- Neolink ---"

case $LOG in
  debug) export RUST_LOG="neolink=debug" ;;
  info)  export RUST_LOG="neolink=info"  ;;
  warn)  export RUST_LOG="neolink=warn"  ;;
  error) export RUST_LOG="neolink=error" ;;
  *)     echo "Unknown log level" ;;
esac

case $MODE in
  rtsp) neolink rtsp --config /config/neolink.toml ;;
  mqtt) neolink mqtt --config /config/neolink.toml ;;
  dual) neolink mqtt-rtsp --config /config/neolink.toml ;;
  *)    echo "Unknown mode option" ;;
esac
