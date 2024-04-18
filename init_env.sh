#!/bin/bash

echo 'Initializing environment..'
minikube start
echo '' 

echo 'Creating namespace..'
kubectl create namespace sre
echo ''


echo 'Performing deployment..'
kubectl apply -f upcommerce-deployment.yml -n sre
kubectl apply -f swype-deployment.yml -n sre
chmod +x watcher.sh
