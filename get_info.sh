#!bin/sh

if [ $# -eq 0 ]
  then
    echo "Need one of the following args : \"ip\" or \"shell\""
	exit
fi

if [ $1 = "ip" ]; then
{
	IP="$(minikube  ip)"
	echo -n nginx ip '(http)': $IP
	kubectl get svc | grep -oP '80:.{0,5}' | grep -oP ':.{0,5}'
	echo -n nginx ip '(https)': $IP
	kubectl get svc | grep -oP '443:.{0,5}' | grep -oP ':.{0,5}'
}
fi
if [ $1 = "shell" ]; then
{
	POD_NAME="$(kubectl get pod | grep -oP 'nginx-.{0,16}')"
	kubectl exec -it $POD_NAME -- /bin/sh
}
fi
