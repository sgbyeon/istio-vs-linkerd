#!/bin/bash

linkerd uninstall | kubectl delete -f -
