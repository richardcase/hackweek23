# Day 1

## Research

Watched the follow 2 videos to give a background on kcp and kube-bind.

### Kcp: Towards 1,000,000 Clusters

([Source](https://youtu.be/fGv5dpQ8X5I))

- [[CRD]]s are everywhere
- Isolation from ns are weak, separatre names only nothing else
- Workspace is like a cluster to the user
- Goal of 1,000,000 workspaces
- Its not about containers
- A generic api server with only CRDs
- Controllers that are multi-workspace aware
  - Build multi-tenant services
- 3 dimensions to the project
  - horizontal scaling
  - API service provider persona
  - planet scale w/ eventual consistent shared state
- Use cases:
  - CI testing for controllers
  - Org hierarchies (model in workspaces, workspaces have 1 parent)
  - Everyone can be cluster admin for their own cluster, permissions separate from the other workspace
  - Multi-tenant operators
  - Edge /iot - consistent control plane
- Kubernetes at its core:
  - Every workspace is kubernetes (with pod APIs disabled)
  - Kubernetes tooling just works
  - 100 % pure kubernetes APIs (technically everything is a CRD)
- Rule set in stone: **behavioural changes to the API are forbidden**

### Towards Something Better Than CRDs In a Post-Operator World

([Source](https://youtu.be/Uv0ivz5xej4))

- kude-bind can be used to create a UX around a SaaS model
- Instead of tenants installing operators like the MongoDB operator they can just bind to a service and create a instance of the CRD
- The service provider can then do the provisioning on their side
- Q: how can kube-bind and kcp play nicely together?

## Practical

- Followed through the readme examples in the [kcp](https://github.com/kcp-dev/kcp) repo.
- Created shell scripts to test the cluster syncer.
  - Download kcp from the repo
  - Open a terminal and run [1-start-kcp.sh](clustersync/1-start-kcp.sh)
  - Open another terminal and run [2-create-child-clusters.sh 5](clustersync/2-create-child-clusters.sh) to create 5 child clusters.
- Dont use the `ghcr.io/kcp-dev/kcp/syncer:v0.8.0` image, instead use `ghcr.io/kcp-dev/kcp/syncer:v0.10.0`

## Plan for day 2

- Investigate and create a multi-workspace operator
