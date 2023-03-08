conn=`cat /etc/systemd/system/check_mk.socket | grep MaxConnectionsPerSource | awk -F '=' '{print $2}'`
conn_p=$((conn+10))
echo $conn_p
sed -E "s/MaxConnectionsPerSource=(.*)/MaxConnectionsPerSource=$conn_p/" /etc/systemd/system/check_mk.socket
systemctl daemon-reload
systemctl restart check_mk.socket
systemctl status check_mk.socket
