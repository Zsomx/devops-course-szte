# Quick Kerberos demo - notes
# "FORKED" from: https://github.com/dosvath/kerberos-containers
# Based on: https://www.confluent.io/blog/containerized-testing-with-kerberos-and-ssh/
## KDC
kadmin.local
addprinc -randkey host/ssh-server@EXAMPLE.COM
ktadd -k /sshserver.keytab host/ssh-server@EXAMPLE.COM
addprinc sshuser

## SSH server
GSSAPIAuthentication yes
GSSAPICleanupCredentials yes
/etc/krb5.conf: 
[libdefaults]
    default_realm = EXAMPLE.COM
    forwardable = TRUE
[realms]
    EXAMPLE.COM = {
            kdc_ports = 88
            kadmind_port = 749
            kdc = kdc-server
            admin_server = kdc-server
    }
[domain_realm]
        kdc-server= EXAMPLE.COM

/sshserver.keytab ---> /etc/krb5.keytab
adduser sshuser

## SSH Client
ssh-server ip --> hosts (docker resolving issue with Kerberos TGT)

GSSAPIAuthentication yes
/etc/krb5.conf: 
[libdefaults]
    default_realm = EXAMPLE.COM
    forwardable = TRUE
[realms]
    EXAMPLE.COM = {
            kdc_ports = 88
            kadmind_port = 749
            kdc = kdc-server
            admin_server = kdc-server
    }
[domain_realm]
        kdc-server= EXAMPLE.COM

kinit sshuser
ssh sshuser@ssh-server

(Fun fact: ssh -vv without hosts file hack)