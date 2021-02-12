#!bin/sh

#colors
GREEN='\e[0;32m'
YELLOW='\033[33m'
END='\e[0;0m'

echo $YELLOW"Cleaning and starting minikube..."$END
minikube delete
minikube start --vm-driver=docker
echo $GREEN"Minikube is running"$END

eval $(minikube docker-env)
minikube addons enable metrics-server
minikube addons enable dashboard 

# METALLB
echo $YELLOW"Installing MetalLB"$END
kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl diff -f - -n kube-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
minikube addons enable metallb


kubectl apply -f srcs/metallb.yaml

# NGINX
docker build -t nginx-service ./srcs/nginx
kubectl apply -f srcs/nginx-service.yaml

echo $YELLOW"Starting dashboard..."$END
minikube dashboard &