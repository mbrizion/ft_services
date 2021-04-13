#!/bin/sh

echo -e "pass\npass" | adduser -h /mnt/ftps/user user
vsftpd /etc/vsftpd/vsftpd.conf