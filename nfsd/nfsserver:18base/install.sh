#! /bin/bash
# @edt ASIX M06 2018-2019
# instal.lacio
#  - crear usuaris locals
# -------------------------------------
groupadd localgrp01
groupadd localgrp02
useradd -g users -G localgrp01 local01
useradd -g users -G localgrp01 local02
useradd -g users -G localgrp01 local03
useradd -g users -G localgrp02 local04
useradd -g users -G localgrp02 local05
useradd -g users -G localgrp02 local06
echo "local01" | passwd --stdin local01
echo "local02" | passwd --stdin local02
echo "local03" | passwd --stdin local03
echo "local04" | passwd --stdin local04
echo "local05" | passwd --stdin local05
echo "local06" | passwd --stdin local06

mkdir /tmp/home
mkdir /tmp/home/pere
mkdir /tmp/home/anna
mkdir /tmp/home/marta
mkdir /tmp/home/jordi
mkdir /tmp/home/admin
chown pere.users /tmp/home/pere
chown anna.alumnes /tmp/home/anna
chown marta.alumnes /tmp/home/marta
chown jordi.users /tmp/home/jordi
chown admin.wheel /tmp/home/admin

bash /opt/docker/auth.sh
cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/system-auth-edt /etc/pam.d/system-auth-edt
cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
ln -sf /etc/pam.d/system-auth-edt /etc/pam.d/system-auth

cp /opt/docker/exports /etc/exports
mkdir /run/rpcbind 
touch /run/rpcbind/rpcbind.lock

