#!/bin/bash
read -p "please input nfs server ip:" nfs_serer_ip
read -p "please input nfs server path:" nfs_serer_path

sed -i "s/192.168.227.127/${nfs_serer_ip}/g" *.yaml
sed -i "s@/data/nfs/client@${nfs_serer_path}@g" *.yaml

kubectl apply -f rbac.yaml
kubectl apply -f deployment.yaml
kubectl apply -f storageclass.yaml
kubectl apply -f grafana-pvc.yaml
kubectl apply -f grafana-deployment.yaml
kubectl apply -f prometheus-prometheus.yaml
