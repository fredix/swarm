docker service create --name drone-wall --constraint 'node.labels.location == home' --network traefik-net --label traefik.frontend.rule=Host:drone-wall.fredix.xyz --label traefik.port=80 drone/drone-wall