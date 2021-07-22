#!/bin/bash

OLDEXTERNALIP=$(grep -A 1 externalIPs nginx-ingress-controller.yaml | grep - | cut -d- -f2 | sed 's/ //g')
NEWEXTERNALIP="52.79.78.230"

sed -i "s/$OLDEXTERNALIP/$NEWEXTERNALIP/g" nginx-ingress-controller.yaml

linkerd check --pre
if [ $? -ne 0 ]; then
    echo "linkerd check failue"
    exit 1
fi

linkerd install | kubectl apply -f -

sleep 60

linkerd check

echo "[apply nginx-ingress-controller.yaml]"
kubectl apply -f nginx-ingress-controller.yaml
sleep 10

echo "[apply bookinfo-with-nodeSelector.yaml]"
kubectl apply -f bookinfo-with-nodeSelector.yaml
sleep 10

kubectl get deploy -o yaml | linkerd inject - | kubectl apply -f -

echo "[apply linkerd-nginx-ingress.yaml]"
kubectl apply -f linkerd-nginx-ingress.yaml
sleep 10
