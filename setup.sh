#!bin/sh

#colors
GREEN='\e[0;32m'
YELLOW='\033[33m'
CYAN='\e[0;36m'
END='\e[0;0m'

echo $YELLOW"Cleaning and starting minikube..."$END
minikube delete
minikube start --vm-driver=docker
echo $GREEN"Minikube is running"$END

eval $(minikube docker-env)
minikube addons enable dashboard 

# METALLB
echo $YELLOW"Installing MetalLB"$END
kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl diff -f - -n kube-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml

#SECRET
echo $YELLOW"Creating secret..."$END
kubectl create secret generic mysql-pass --from-literal=password=password

# MYSQL
echo $YELLOW"Installing MySql"$END
docker build -t mysql ./srcs/mysql
kubectl apply -f srcs/mysql.yaml

# WORDPRESS
echo $YELLOW"Installing Wordpress"$END
docker build -t wordpress ./srcs/wordpress
kubectl apply -f srcs/wordpress.yaml

# PMA
echo $YELLOW"Installing PhpMyAmdin"$END
docker build -t phpmyadmin ./srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin.yaml

# NGINX
echo $YELLOW"Installing nginx"$END
docker build -t nginx-service ./srcs/nginx
kubectl apply -f srcs/nginx-service.yaml

# FTPS
# echo $YELLOW"Installing ftps"$END
# docker build -t ftps ./srcs/ftps
# kubectl apply -f srcs/ftps.yaml

echo $YELLOW"Starting dashboard..."$END
minikube dashboard &


echo  $CYAN"pma	:\nid	: user\npass	: password"$END
# docker build -t ftps ./srcs/ftps && kubectl delete -f srcs/ftps.yaml && kubectl apply -f srcs/ftps.yaml