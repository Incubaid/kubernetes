#!/bin/bash

# if [ $# -ne 1 ]
# then
#   echo "Usage: $0 <CLIENT_KEY_NAME>"
#   exit
# fi

set -ex

KEY_NAME='test'
NAMESPACE=$(kubectl get pods --all-namespaces -l type=openvpn -o jsonpath='{.items[0].metadata.namespace}')
POD_NAME=$(kubectl get pods -n $NAMESPACE -l type=openvpn -o jsonpath='{.items[0].metadata.name}')
SERVICE_NAME=$(kubectl get svc -n $NAMESPACE -l type=openvpn  -o jsonpath='{.items[0].metadata.name}')
SERVICE_IP=$(kubectl get svc -n $NAMESPACE $SERVICE_NAME -o go-template='{{range $k, $v := (index .status.loadBalancer.ingress 0)}}{{$v}}{{end}}')
kubectl -n $NAMESPACE exec -it $POD_NAME /etc/openvpn/setup/newClientCert.sh $KEY_NAME $SERVICE_IP
kubectl -n $NAMESPACE exec -it $POD_NAME cat /etc/openvpn/certs/pki/$KEY_NAME.ovpn > $KEY_NAME.ovpn

# brew install openvpn

#make sure we have path to openvpn
export PATH=$(brew --prefix openvpn)/sbin:$PATH

# mkdir -p ~/js9host/cfg/openvpn
# mv test.ovpn ~/js9host/cfg/openvpn/test.ovpn


