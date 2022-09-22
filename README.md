# K8S Policies




```

## Build Docker image

```
docker build -t k3d-registry:36091/helloworld-go:v0.1 .
docker push k3d-registry:36091/helloworld-go:v0.1
```

## Deploy Gatekeeper constraints

```
kubectl apply -f constraints/ensure-only-validated-repo.yaml
kubectl apply -f constraints/forbid-run-as-root-user.yaml
```

## Deploy helloworld pod

```
kubectl create -f k8s/helloworld-pod.yaml
```

## Check Violations

```
kubectl describe constrainttemplate.templates.gatekeeper.sh/ensurevalidatedrepos
```
