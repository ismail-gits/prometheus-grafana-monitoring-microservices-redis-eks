kubectl delete -f adservice-deployment.yaml -n microservices
kubectl delete -f cartservice-deployment.yaml -n microservices
kubectl delete -f checkoutservice-deployment.yaml -n microservices
kubectl delete -f currencyservice-deployment.yaml -n microservices
kubectl delete -f emailservice-deployment.yaml -n microservices
kubectl delete -f frontend-deployment.yaml -n microservices
kubectl delete -f paymentservice-deployment.yaml -n microservices
kubectl delete -f productcatalogservice-deployment.yaml -n microservices
kubectl delete -f recommendationservice-deployment.yaml -n microservices
kubectl delete -f redis-cart-deployment.yaml -n microservices
kubectl delete -f shippingservice-deployment.yaml -n microservices