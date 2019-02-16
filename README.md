# pam-homes-nfs-samba
# @edt ASIX M06-ASO Curs 2017-2018

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)

ASIX M06-ASO Escola del treball de barcelona


Repositori per implementar via pam_mount.so els homes dels usuaris utilitzant:

 * **nfs**
 * **samba**
 * **sshfs**

#### NFS

* **hostpam:18homenfs** host pam amb authenticació ldap. Munta els homes de l'usuari via nfs.
Per posar en funcionament aquest model calen tres elements: un servidor LDAP, un servidor NFS i un host que actua de 
client amb PAM + LDAP + pam_mount.so per carregar els homes dels usuaris via NFS.

* **hostpam:18homenfsd** host pam amb authenticació ldap. Munta els homes de l'usuari via nfs.
Per posar en funcionament aquest model calen tres elements: un servidor LDAP, un servidor NFS i un host que actua de
client amb PAM + LDAP + pam_mount.so per carregar els homes dels usuaris via NFS. Varia de l'anterior en que
utilitza un bucle *cutre* per quedar en detach.

#### SAMBA

* **hostpam:18homesamba** host pam amb authenticació ldap. Munta els homes de l'usuari via samba.
Per posar en funcionament aquest model calen tres elements: un servidor LDAP, un servidor SAMBA i un host que actua de
client amb PAM + LDAP + pam_mount.so per carregar els homes dels usuaris via SAMBA.

* **hostpam:18homesambad** Idem host pam amb autenticació ldap, basat en hostpam:18homesamba que incoprpora un bucle 
*cutre* per poder quedar en detach.


#### Execució

En global s'engega el servidor ldap, el servidor nfs i el host amb pam configurat per crear i muntar els homes dels usuaris via nfs.

Per NFS:
```
docker run --rm --name ldap -h ldap --net ldapnet -d edtasixm06/ldapserver:18group
docker run --rm --name nfsserver -h nfserver --net ldapnet --privileged -it edtasixm06/nfsserver:18base
docker run --rm --name host -h host --net ldapnet --privileged -it edtasixm06/hostpam:18homenfs

```

```
docker run --rm --name ldap -h ldap --net ldapnet -d edtasixm06/ldapserver:18group
docker run --rm --name nfsserver -h nfserver --net ldapnet --privileged -d edtasixm06/nfsserver:18detach
docker run --rm --name host -h host --net ldapnet --privileged -d edtasixm06/hostpam:18homenfsd

```


Per SAMBA:
```
docker run --rm --name ldap -h ldap --net sambanet -d edtasixm06/ldapserver:18group
docker run --rm --name host -h host --net sambanet --privileged -it edtasixm06/hostpam:18homesamba

docker run --rm --name samba -h samba --net sambanet --privileged -it edtasixm06/samba:18ldapusers
o bé
docker run --rm --name samba -h samba --net sambanet --privileged -it edtasixm06/samba:18ldapsam
```

```
docker run --rm --name ldap -h ldap --net sambanet -d edtasixm06/ldapserver:18group
docker run --rm --name samba -h samba --net sambanet --privileged -d edtasixm06/samba:18detach
docker run --rm --name host -h host --net sambanet --privileged -d edtasixm06/hostpam:18homesambad
```
