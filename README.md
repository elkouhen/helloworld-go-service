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

## Deploy Gatekeeper templates

```
# clone opa repo 
gomplate -f ./validated-repo/validated-repo-template.yaml | kubectl apply -f -
```

## Deploy Gatekeeper constraints

```
kubectl apply -f constraints/validated-repo-constraint.yaml
```

## Deploy helloworld pod

```
kubectl create -f k8s/helloworld-pod.yaml
```

## Check Violations

```
kubectl describe constrainttemplate.templates.gatekeeper.sh/ensurevalidatedrepos
```
