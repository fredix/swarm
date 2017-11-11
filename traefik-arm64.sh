docker service create --name traefik --constraint=node.role==manager -p 443:443 -p 80:80 -p 8080:8080 --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock --mount type=bind,source=/traefik/etc/,target=/etc/traefik/ --mount type=bind,source=/traefik/log/,target=/log/ --mount type=bind,source=/traefik/etc/certs,target=/certs --network traefik-net  fredix/arm64v8-traefik:1.4.2 --docker --docker.swarmmode --docker.domain=traefik --docker.watch --web
