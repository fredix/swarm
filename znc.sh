# first : docker run -it -v znc-cfg:/znc-data znc --makeconf

docker service create --name znc -p 6697:6697 --constraint 'node.labels.location == home-armv7' --network traefik-net --label traefik.frontend.rule=Host:znc.fredix.xyz --label traefik.docker.network=traefik-net --label traefik.port=6697 --label traefik.backend=znc --mount type=bind,source=/docker_volumes/znc,target=/znc-data znc

