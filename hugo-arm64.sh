docker service create --name hugo-arm64 --network traefik-net --constraint=node.role==manager \
    --label traefik.frontend.rule=Host:fredix.xyz,www.fredix.xyz --label traefik.port=1313 \
    --mode "replicated" \
    --replicas 1 \
    --update-parallelism 1 \
    --update-delay 10s \
    --stop-grace-period 5s \
    --restart-condition "any" \
    --restart-max-attempts 10 \
    --health-cmd "curl --fail http://localhost:1313" \
    --health-interval 3s --health-retries 5 --health-timeout 2s \
    fredix/arm64v8-blog
