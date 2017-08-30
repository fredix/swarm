# SUR LE NOEUD WORKER :

docker volume create --name cachet
docker run --rm --name cachet -v cachet:/var/www/html -e DB_DRIVER=sqlite -p 8000:8000 cachethq/docker:2.3.12
docker logs cachet (copier le APP_KEY)
vim /var/lib/docker/volumes/cachet/_data/.env
supprimer tous les DB_ sauf DB_DRIVER="sqlite"

docker run -d --name cachet -v cachet:/var/www/html -e DB_DRIVER=sqlite -e APP_KEY=base64:COLLER_LE_APP_KEY -p 8000:8000 cachethq/docker:2.3.12
docker exec -it cachet bash
touch database/database.sqlite
php artisan migrate
exit

# supprimer le conteneur du noeud worker si le but est d'utiliser docker swarm
docker stop cachet
docker rm cachet

# PUIS DANS SWARM SUR LE MANAGER LEADER :

docker service create --name statut --constraint 'node.labels.location == home' --network traefik-net --label traefik.frontend.rule=Host:statut.fredix.xyz --label traefik.docker.network=traefik-net --label traefik.port=8000 --label traefik.backend=statut --mount type=volume,source=cachet,destination=/var/www/html -e DB_DRIVER=sqlite -e APP_KEY=base64:XXXXX cachethq/docker:2.3.12
