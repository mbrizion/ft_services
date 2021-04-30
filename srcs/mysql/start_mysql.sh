openrc
touch /run/openrc/softlevel
telegraf --config /etc/telegraf/telegraf.conf &
/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart

if [ ! -d /var/lib/mysql/wordpress ]
then
mysql --user=root < init.sql
mysql --user=root wordpress < /home/wordpress.sql
fi

service mariadb stop
exec /usr/bin/supervisord -c /etc/supervisord.conf

# tail -F /dev/null