# K8S Policies



## Create Cluster

```
k3d registry create

k3d cluster create -p "8081:80@loadbalancer" --registry-use k3d-registry:36091 

# check cluster ok
kubectl cluster-info
```

## Delete Cluster 

```
k3d cluster delete
```

## Deploy gatekeep

```
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml
```

## Build Docker image

```
docker build -t k3d-registry:36091/helloworld-go:v0.1 .
docker push k3d-registry:36091/helloworld-go:v0.1
```

## Deploy helloworld pod

```
kubectl create -f k8s/helloworld-pod.yaml
```

## Deploy Gatekeeper constraints

```
gomplate -f gatekeeper/validated-repo-contraint.yaml | kubectl apply -f -
```