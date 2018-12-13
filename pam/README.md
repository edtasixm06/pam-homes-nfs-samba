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


