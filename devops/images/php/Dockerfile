FROM webdevops/php-nginx:8.3


ARG UID=1000
ARG GID=1000

#
#CMD ["php-fpm"]
#
#COPY config/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
#
## nodejs and npm
RUN apt-get update && apt-get install -y ca-certificates curl gnupg
#
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_VERSION=20
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_VERSION}.x nodistro main" > /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install nodejs -y

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

COPY config/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
