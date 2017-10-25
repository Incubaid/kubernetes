kubectl apply -f ./recipes/

kubectl create rolebinding dubaisecret-binding --clusterrole=admin --user=dubaisecret --namespace=default

