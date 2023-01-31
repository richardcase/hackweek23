#!/usr/bin/env bash

NUMCLUSTERS="${1:-1}"

for i in $(seq 1 1 $NUMCLUSTERS)
do
    echo "Creating child cluster $i"
    name="child$i"
    childkube="_out/child$name.kubeconfig"
    syncerpath="_out/syncer-$name-main.yaml"

    kind create cluster --kubeconfig $childkube --name $name
    kubectl kcp workload sync $name --kubeconfig .kcp/admin.kubeconfig  --syncer-image ghcr.io/kcp-dev/kcp/syncer:v0.10.0 -o $syncerpath
    kubectl --kubeconfig $childkube apply -f $syncerpath
done
