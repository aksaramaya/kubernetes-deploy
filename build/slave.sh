#!/bin/bash
cd /tmp/kube-deploy/docker-multinode
export MASTER_IP='192.168.7.11'
bash ./worker.sh
