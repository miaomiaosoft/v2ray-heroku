echo -e -n "$CONFIG_JSON1" > /etc/v2ray/config.json
echo -e -n "$PORT" >> /etc/v2ray/config.json
echo -e -n "$CONFIG_JSON2" >> /etc/v2ray/config.json
echo -e -n "$UUID" >> /etc/v2ray/config.json
echo -e -n "$CONFIG_JSON3" >> /etc/v2ray/config.json

rinetd -f -c /etc/rinetd-bbr.conf raw eth0
v2ray -config=/etc/v2ray/config.json
