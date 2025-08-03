#!/bin/bash

set -x # to test stderr output in /var/log/killercoda

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl create ns ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx

echo starting... # to test stdout output in /var/log/killercoda
sleep 3
echo done > /tmp/background0
