# K8S Policies

## Create Cluster

```
k3d registry create

k3d cluster create -p "8081:80@loadbalancer" --registry-use k3d-registry:36091 

# check cluster ok
kubectl cluster-info
```

## Deploy resources

```
kubectl create -f k8s/resources.yaml
```

## Deploy REGO

```
kubectl create configmap example-policy --from-file rego/example.rego
kubectl create configmap admission-policy --from-file rego/admission.rego
```