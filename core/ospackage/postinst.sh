#!/bin/sh

set -ex

# NB - If updating this script, also update ./docker/scripts/config_radixdlt.sh

# vars
RORKDLT_USER=radixdlt
RORKDLT_SERVICE_FILE=radixdlt.service
RORKDLT_DIRECTORY_NAME=radixdlt

# paths
RORKDLT_HOME="/opt/$RORKDLT_DIRECTORY_NAME"
RORKDLT_LOG_DIR="/var/log/$RORKDLT_DIRECTORY_NAME"

# create user and group idempotently
getent group $RORKDLT_USER >/dev/null || groupadd -r $RORKDLT_USER
getent passwd $RORKDLT_USER >/dev/null || useradd -r -d "$RORKDLT_HOME" -g $RORKDLT_USER $RORKDLT_USER

# create log dir
mkdir -p "$RORKDLT_LOG_DIR"

# make sure all files are owned by the radixdlt user/group
chown -Rf "$RORKDLT_USER:$RORKDLT_USER" "$RORKDLT_HOME" "$RORKDLT_LOG_DIR"

# Make sure that systemd files are owned by root
chown root:root "/etc/systemd/system/$RORKDLT_SERVICE_FILE"

#systemctl daemon-reload
#systemctl start $RORKDLT_SERVICE_FILE
