#! /bin/bash
# @edt ASIX M06 2018-2019
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"
/usr/sbin/nslcd && echo "nslcd Ok"
/usr/sbin/nscd && echo "nscd Ok"

/usr/sbin/rpcbind && echo "rpcbind"
/usr/sbin/rpc.statd && echo "rpc.stad"
/usr/sbin/exportfs -av
/bin/bash

