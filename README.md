# Modx+Gitify in Docker
Install Docker ( https://docs.docker.com/engine/installation/ ) and Docker-Compose ( https://docs.docker.com/compose/install/ )
Use this as ```docker-compose.yml```:
```yml
web:
  container_name: modx
  image: stefaan/modx-gitify-docker
  links:
    - db:mysql
  ports:
    - 80:80
  volumes:
    - ./data:/var/www/html/_data
    - ./assets:/var/www/html/assets
db:
  image: mysql
  environment:
    MYSQL_ROOT_PASSWORD: example
  ports:
    - 3306:3306
  command: mysqld --sql-mode=NO_ENGINE_SUBSTITUTION
```

After that you can execute:
```
docker-compose up
```

To extract the modX-database to ```data/``` you can run this command:
```
docker exec -it modx /opt/Gitify/Gitify extract
```

If you want to transfer the ```data/``` to the modX-Database:
```
docker exec -it modx /opt/Gitify/Gitify build --no-cleanup --no-backup
```
