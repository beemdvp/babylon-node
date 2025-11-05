#!/bin/sh

set -x

# vars
RORKDLT_SERVICE_FILE=radixdlt.service

# kill the process
systemctl stop $RORKDLT_SERVICE_FILE || :
