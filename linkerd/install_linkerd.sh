#!/bin/bash

linkerd check --pre
if [ $? -ne 0 ]; then
    echo "linkerd check failue"
    exit 1
fi

linkerd install | kubectl apply -f -

#sleep 10

#linkerd check

kubectl apply -f nginx-ingress-controller.yaml
sleep 3
kubectl apply -f linkerd-nginx-ingress.yaml
sleep 3
kubectl apply -f bookinfo-with-nodeSelector.yaml
sleep 10

kubectl get deploy -o yaml | linkerd inject - | kubectl apply -f -
