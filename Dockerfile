FROM suse/sles12sp2
MAINTAINER "Jason Evans <jevans@suse.com>"

# The ADD command adds files from your directory into the new image
ADD *.repo /etc/zypp/repos.d/
ADD *.service /etc/zypp/services.d

RUN zypper refs && zypper refresh

RUN     zypper  --non-interactive in apache2 \
        apache2-mod_php7

ADD index.html /srv/www/htdocs/

CMD     /usr/sbin/apachectl -D FOREGROUND

EXPOSE  80
