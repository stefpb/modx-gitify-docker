# Modx+Gitify in Docker

Install Docker ( https://docs.docker.com/engine/installation/ ) and Docker-Compose ( https://docs.docker.com/compose/install/ ).


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
    - ./assets/template:/var/www/html/assets/template
db:
  image: mysql
  environment:
    MYSQL_ROOT_PASSWORD: example
  ports:
    - 3306:3306
  command: mysqld --sql-mode=NO_ENGINE_SUBSTITUTION
```

For an individual ```.gitify```-File, create this file and add this line to ```volumes:```:
```
    - ./.gitify:/var/www/html/.gitify
```

After that you can execute:
```
docker-compose up
```

Now you can use http://localhost/ and http://localhost/manager (admin/admin).

To extract the modX-database to ```data/``` you can run this command:
```
docker exec -it modx /opt/Gitify/Gitify extract
```


If you want to transfer the ```data/``` to the modX-Database:
```
docker exec -it modx /opt/Gitify/Gitify build --no-cleanup --no-backup
```

Install packages, put it in your gitify-File and run:
```
docker exec -it modx /opt/Gitify/Gitify package:install --all
```

For debugging you get into by typing:
```
docker exec -it modx bash
```

To remove all:
```
docker stop modx modx_db
docker rm modx modx_db
```
