set -ex

# gcloud config set compute/zone us-central1-a
gcloud config set compute/zone europe-west1-c
gcloud container clusters create tf
gcloud container clusters get-credentials kds
helm init --upgrade
