#!/bin/bash

# This script is used to configure the portainer which monitoring and control for your Kubernetes cluster or Docker Service

# Check recreate a password
arg=$1
domain_letencrypt=$2
container_portainer_name=$3
network_portainer_name=$4

if [ -z "$arg" ]; then
    echo "Please specify a arguments for optional, (--reset-password) or (--create-container)" && exit 1
fi

if [ -z "$domain_letencrypt" ]; then
    echo "Please specify a domain with verify by domain_letencrypt" && exit 1
fi

if [ -z "$container_portainer_name" ]; then
    echo "Please specify a portainer container name for identity your container" && exit 1
fi

if [ -z "$network_portainer_name" ]; then
    echo "Please specify a portainer network name for identity network for container" && exit 1
fi

if [[ "$arg" == "--reset-password" ]]; then
    docker stop $container_portainer_name
    docker run --rm -v portainer_data:/data portainer/helper-reset-password
    docker start $container_portainer_name
fi
if [[ "$arg" == "--create-container" ]]; then
    # Not reset password - create a new one
    docker run -d --name $container_portainer_name --restart always \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v portainer_data:/data \
        -v /etc/letsencrypt/live/$domain_letencrypt:/certs/live/$domain_letencrypt:ro \
        -v /etc/letsencrypt/archive/$domain_letencrypt:/certs/archive/$domain_letencrypt:ro \
        --network $network_portainer_name  portainer/portainer-ce:latest \
        --sslcert /certs/live/$domain_letencrypt/fullchain.pem \
        --sslkey /certs/live/$domain_letencrypt/privkey.pem
fi