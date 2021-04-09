/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart

mysql --user=root < init.sql

mysql --user=root wordpress < /home/wordpress.sql

tail -F /dev/null