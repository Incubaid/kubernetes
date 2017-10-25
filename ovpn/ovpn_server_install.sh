set -ex
helm repo add stable http://storage.googleapis.com/kubernetes-charts
helm install stable/openvpn

#will keep on waiting, when it all looks ok then  exit at the end
POD_NAME=$(kubectl get pods -l type=openvpn -o jsonpath='{.items[0].metadata.name}') \
&& kubectl log $POD_NAME --follow

