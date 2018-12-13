# privat / pam
# @edt ASIX M06-ASO Curs 2017-2018

Repositori per implementar via pam_mount.so els homes dels usuaris utilitzant:

 * **nfs**
 * **samba**
 * **sshfs**

#### NFS

* **hostpam:18homenfs** host pam amb authenticació ldap. Munta els homes de l'usuari via nfs.
Per posar en funcionament aquest model calen tres elements: un servidor LDAP, un servidor NFS i un host que actua de 
client amb PAM + LDAP + pam_mount.so per carregar els homes dels usuaris via NFS.

#### Execució

En global s'engega el servidor ldap, el servidor nfs i el host amb pam configurat per crear i muntar els homes dels usuaris via nfs.

```
docker run --rm --name ldap -h ldap --net ldapnet -d edtasixm06/ldapserver:18group
docker run --rm --name host -h host --net ldapnet --privileged -it edtasixm06/hostpam:18homenfs
docker run --rm --name nfsserver -h nfserver --net ldapnet --privileged -it edtasixm06/nfsserver:18base
```


