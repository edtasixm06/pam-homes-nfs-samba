#! /bin/bash
# docker network create ldapnet
docker run --rm --name ldap -h ldap --net ldapnet -d edtasixm06/ldapserver:18group
docker run --rm --name host -h host --net ldapnet --privileged -it edtasixm06/hostpam:18homenfs
docker run --rm --name nfsserver -h nfserver --net ldapnet --privileged -it edtasixm06/nfsserver:18base

