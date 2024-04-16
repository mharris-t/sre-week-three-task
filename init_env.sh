#!/bin/bash

echo 'Initializing environment..'
minikube start

echo 'Creating namespace..'
kubectl create namespace sre

echo 'Performing deployment..'
kubectl apply -f upcommerce-deployment.yml -n sre
kubectl apply -f swype-deployment.yml -n sre

