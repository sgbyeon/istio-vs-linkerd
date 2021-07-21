#!/bin/bash

kubectl delete -f bookinfo-with-nodeSelector.yaml
kubectl delete -f linkerd-nginx-ingress.yaml
kubectl delete -f nginx-ingress-controller.yaml

linkerd uninstall | kubectl delete -f -
