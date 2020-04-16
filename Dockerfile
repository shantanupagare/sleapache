FROM registry.suse.com/suse/sles12sp4:latest 
MAINTAINER tux 
RUN zypper ref -s && zypper --non-interactive in apache2

RUN echo "The Web Server is running" > /srv/www/htdocs/test.html 
# COPY data/* /srv/www/htdocs/ 

EXPOSE 80 

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
