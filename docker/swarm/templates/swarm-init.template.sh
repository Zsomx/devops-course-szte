docker swarm init # On ops_base
docker swarm join --token $tokenstring 192.168.56.2:2377 # On app_server