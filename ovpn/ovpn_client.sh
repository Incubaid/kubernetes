
export PATH=$(brew --prefix openvpn)/sbin:$PATH
# sudo openvpn --config ~/js9host/cfg/openvpn/test.ovpn
sudo openvpn --config test.ovpn
