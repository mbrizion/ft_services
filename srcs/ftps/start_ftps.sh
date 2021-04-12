#!/bin/sh
FTP_USERNAME=user;
FTP_PASSWORD=pass;

echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser -h /mnt/ftps/$FTP_USERNAME $FTP_USERNAME
vsftpd /etc/vsftpd/vsftpd.conf