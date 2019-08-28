FROM aijl2008/centos-nginx-php:7.1.30
WORKDIR /data/webroot/phpinfo
COPY . .
RUN chown www-data:www-data . -R
RUN sed -i "s/\/data\/webroot\/public/\/data\/webroot\/phpinfo/g" /usr/local/nginx/conf/nginx.conf
CMD ["/bin/sh", "/data/webroot/phpinfo/run.sh"]
