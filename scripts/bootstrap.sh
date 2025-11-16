#!/usr/bin/env sh

SCRIPT_DIR=$(dirname "$0")

# This sucks, but guix 1.4.0 doesn't support redirects, so we must
# first update to a newer version and only then can we use
# the new remote
guix pull

GUIX_PROFILE=`guix time-machine -C ${SCRIPT_DIR}/../.config/guix/channels-lock.scm`
GUIX="${GUIX_PROFILE}/bin/guix"

$GUIX pull -C ${SCRIPT_DIR}/../.config/guix/channels-lock.scm --allow-downgrades

guix shell --check just stow -- just --justfile ${SCRIPT_DIR}/../justfile home-build home-switch stow
