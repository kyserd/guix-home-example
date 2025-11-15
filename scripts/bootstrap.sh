#!/usr/bin/env sh

SCRIPT_DIR=$(dirname "$0")

GUIX_PROFILE=`guix time-machine -C ${SCRIPT_DIR}/../.config/guix/channels-lock.scm`
GUIX="${GUIX_PROFILE}/bin/guix"

$GUIX pull -C ${SCRIPT_DIR}/../.config/guix/channels-lock.scm
