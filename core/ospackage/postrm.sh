#!/bin/sh

set -ex

RORKDLT_USER=radixdlt

# best effort: remove user & group
! getent passwd $RORKDLT_USER >/dev/null || userdel $RORKDLT_USER >/dev/null 2>&1 || :
! getent group $RORKDLT_USER >/dev/null || groupdel $RORKDLT_USER >/dev/null 2>&1 || :
