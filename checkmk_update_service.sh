##################################################
#                                                #
#__author__ = "biuro@tmask.pl"                   #
#__copyright__ = "Copyright (C) 2023 TMask.pl"   #
#__license__ = "MIT License"                     #
#__version__ = "1.0"                             #
#                                                #
##################################################



conn=`cat /etc/systemd/system/check_mk.socket | grep MaxConnectionsPerSource | awk -F '=' '{print $2}'`
conn_p=$((conn+50))
echo $conn_p
sed -E -i "s/MaxConnectionsPerSource=(.*)/MaxConnectionsPerSource=$conn_p/" /etc/systemd/system/check_mk.socket
cat /etc/systemd/system/check_mk.socket
systemctl daemon-reload
systemctl restart check_mk.socket
systemctl status check_mk.socket
