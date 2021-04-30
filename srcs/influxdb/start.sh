influx << EOF
create database if not exist influxdb
create user influx_user with password 'influx_pass'
grant all on influxdb to influx_user
EOF
exec /usr/bin/supervisord -c /etc/supervisord.conf
