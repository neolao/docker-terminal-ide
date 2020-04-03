FROM neolao/ide
maintainer neolao <contact@neolao.com>

RUN apt-get update && apt-get install -y lsb-release

# Install PHP
RUN sudo apt install ca-certificates apt-transport-https
RUN wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get install -y php7.3-cli php7.3-mbstring php7.3-xml php7.3-msgpack

# Install PHPUnit
RUN wget -O /usr/bin/phpunit https://phar.phpunit.de/phpunit-8.phar
RUN chmod +x /usr/bin/phpunit
