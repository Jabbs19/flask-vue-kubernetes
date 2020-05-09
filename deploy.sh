#!/bin/bash

NAMESPACE="flask-test"

echo "Creating the volume..."

kubectl apply -f ./kubernetes/persistent-volume.yml --namespace=$NAMESPACE
kubectl apply -f ./kubernetes/persistent-volume-claim.yml --namespace=$NAMESPACE


echo "Creating the database credentials..."

kubectl apply -f ./kubernetes/secret.yml --namespace=$NAMESPACE


echo "Creating the postgres deployment and service..."

kubectl create -f ./kubernetes/postgres-deployment.yml --namespace=$NAMESPACE
kubectl create -f ./kubernetes/postgres-service.yml --namespace=$NAMESPACE



echo "Creating the flask deployment and service..."

kubectl create -f ./kubernetes/flask-deployment.yml --namespace=$NAMESPACE
kubectl create -f ./kubernetes/flask-service.yml --namespace=$NAMESPACE


echo "Adding the ingress..."

kubectl apply -f ./kubernetes/minikube-ingress.yml --namespace=$NAMESPACE


echo "Creating the vue deployment and service..."

kubectl create -f ./kubernetes/vue-deployment.yml --namespace=$NAMESPACE
kubectl create -f ./kubernetes/vue-service.yml --namespace=$NAMESPACE
