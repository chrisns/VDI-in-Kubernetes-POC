#!/bin/sh

minikube start --memory=8192 --addons=ingress --cpus=4

eval $(minikube docker-env)

docker build -t chrisns/my-desktop:build .

kubectl kustomize . | sed -e "s/MINIKUBE_IP/$(minikube ip)/g" | kubectl apply -f -

open http://mydesktop.$(minikube ip).xip.io/vnc.html
