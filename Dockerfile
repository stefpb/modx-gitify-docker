FROM budjizu/modx

MAINTAINER Stefaan Loehers

COPY gitify /var/www/html/.gitify

RUN apt-get update && \
	apt-get install -qy git mysql-client && \
	rm -rf /var/lib/apt/lists/* && \
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
	php composer-setup.php && \
	php -r "unlink('composer-setup.php');" && \
	chmod +x composer.phar && \
	mv composer.phar /usr/bin/composer && \
	cd /opt && \
	git clone https://github.com/modmore/Gitify.git Gitify && \
	cd Gitify && \
	composer install && \
	chmod +x Gitify && \
	cd /var/www/html/ && \
	mkdir -pm777 _data _backup assets

CMD ["apache2-foreground"]
