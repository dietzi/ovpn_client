#!/usr/bin/with-contenv bashio

echo client > client.conf
echo dev tun >> client.conf
echo proto udp >> client.conf
echo remote $(bashio::config 'remote_host') $(bashio::config 'remote_port') >> client.conf
echo resolv-retry infinite >> client.conf
echo nobind >> client.conf
echo persist-key >> client.conf
echo persist-tun >> client.conf
echo ca ca.crt >> client.conf
echo auth-user-pass >> client.conf
echo compress lz4 >> client.conf
echo auth-user-pass login.conf >> client.conf
echo cipher AES-256-CBC >> client.conf
echo keepalive 1 5 >> client.conf
echo daemon >> client.conf

wget -O ca.crt $(bashio::config 'ca_download_url')

openvpn client.conf