docker service create --name test_bee --constraint 'node.labels.location == home' --network traefik-net --label traefik.frontend.rule=Host:test.fredix.xyz --label traefik.port=8080 fredix/test_bee
