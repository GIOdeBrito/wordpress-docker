# Run the container

#sudo docker compose down --remove-orphans

sudo docker compose up -d --build

sudo docker logs wordpress -f