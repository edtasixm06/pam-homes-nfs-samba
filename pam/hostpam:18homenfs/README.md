# PAM
## @edt ASIX M06-ASO Curs 2018-2019

Repositori d'exemples de containers docker que utilitzen PAM

 * **hostpam:18hostnfs** host pam amb authenticació ldap. Munta els homes de l'usuari via nfs.
Atenció, per poder realitzar el mount cal que el container es generi amb l'opció **--privileged**.

#### Execució

```
docker run --rm --name host -h host --net ldapnet --privileged -it edtasixm06/hostpam:18auth
```

#### Configuracions

system-auth:
```
session     optional      pam_mkhomedir.so
session     [success=1 default=ignore] pam_succeed_if.so service in crond quiet use_uid
session     [success=1  default=ignore] pam_succeed_if.so uid <= 5000
   session     optional      pam_mount.so
session     sufficient    pam_unix.so

```

pam_mount.conf.xml (només a pere se li genera el  ramdisk):
```
<volume user="pere" fstype="tmpfs" mountpoint="~/test" options="size=10M,uid=%(USER),mode=0755" />
<volume user="*" fstype="nfs" server="172.20.0.1" path="/var/tmp/home/%(USER)"  mountpoint="~/%(USER)" />
```


#### Utilització

```
[local01@host ~]$ su - local02
pam_mount password:
[local02@host ~]$ pwd
/home/local02
[local02@host ~]$ ll
total 0

[local01@host ~]$ su - pere
pam_mount password:
[pere@host ~]$ pwd
/tmp/home/pere
[pere@host ~]$ ll
total 4
drwx------. 3 pere users 4096 Nov 24 14:44 pere
drwxr-xr-x. 2 pere users   40 Nov 24 16:26 test
```

