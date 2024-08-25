# README.md

To run this Python app as a cluster of a minimum of 3 nodes,
we create the replica set using the configuration file call `market-data-replica-set.yml`
and run the following commands:
```bash
# Start Minikube
minikube start

# Build the container as defined in `Dockerfile`
docker build -t market-data:lastest .

# Check if your docker has built the image
docker image ls

# Load the image into minikube's image repository
minikube image load market-data:latest

# Bring up the replica set in K8s (minikube)
kubectl apply -f ./market-data-replica-set.yml

# Check if the pods are in the running state
kubectl get pods
```

Deploy the service as defined in `market-data-service.yml`
```bash
kubectl apply -f market-data-service.yml
```

Now you can access the service, which acts like a load balancer using the k8s `NodePort` spec type:
```bash
# Get the IP address
SVC_IP=$(minikube ip)

# Node port is from 'NodePort' variable in the market-data-service.yml file
PORT=30623

curl http://${SVC_IP}:${PORT}/ping
```
