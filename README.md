# Modx+Gitify in Docker
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