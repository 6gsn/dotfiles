# Setup for nvoice-main

export NVOICE_BASE=$HOME/src/nvoice
export NVOICE_SHARE=$NVOICE_BASE/tmp/share
export NVOICE_DEPLOY=$NVOICE_BASE/tmp/deploy
export NVOICE_TEMP=$NVOICE_BASE/tmp/tmp
export NVOICE_DATA=$NVOICE_BASE/tmp/data

[[ ! -d "${NVOICE_SHARE}" ]] && mkdir -p "${NVOICE_SHARE}"
[[ ! -d "${NVOICE_DEPLOY}" ]] && mkdir -p "${NVOICE_DEPLOY}"
[[ ! -d "${NVOICE_TEMP}" ]] && mkdir -p "${NVOICE_TEMP}"
[[ ! -d "${NVOICE_DATA}" ]] && mkdir -p "${NVOICE_DATA}"

export LD_LIBRARY_PATH=${NVOICE_SHARE}/lib:${LD_LIBRARY_PATH}
