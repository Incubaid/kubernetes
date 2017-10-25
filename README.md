# kubernetes_tests

## requirements

- install the required tools e.g. install_googlekube.sh ...
- also install https://github.com/kubernetes/helm

## openvcloud

see dir openvcloud_hosts

need to add instructions how to put a kubernetes on the openvcloud

## google kubernetes instructions

to connect to the cluster
```bash
gcloud container clusters get-credentials tf --zone europe-west1-c --project constant-carver-655
```

to start proxy (dashboard)
```bash
kubectl proxy
```  
 
- http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/.
- https://console.cloud.google.com/compute/instances?project=constant-carver-655


## further links of sw we are playing with

- https://github.com/kubernetes/charts/tree/master/stable/traefik
- https://github.com/dask/distributed
- https://github.com/coredns/coredns
