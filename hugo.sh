docker service create --name hugo --network traefik-net --label traefik.frontend.rule=Host:fredix.xyz,www.fredix.xyz --label traefik.port=1313 fredix/hugo
