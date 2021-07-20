#!/bin/bash

linkerd check --pre
if [ $? -ne 0 ]; then
    echo "linkerd check failue"
    exit 1
fi

linkerd install | kubectl apply -f -

sleep 10

linkerd check
