FROM php:7.1.7-apache
MAINTAINER fredix@protonmail.com

ENV PHPSYSINFO_VERSION 3.2.7

ADD https://github.com/phpsysinfo/phpsysinfo/archive/v${PHPSYSINFO_VERSION}.tar.gz /tmp/
RUN mv /tmp/phpsysinfo-${PHPSYSINFO_VERSION}/* /var/www/html/ \
	&& rm -rf /tmp/phpsysinfo-${PHPSYSINFO_VERSION}
RUN cat /var/www/html/phpsysinfo.ini.new | sed 's/^LOAD_BAR=false/LOAD_BAR=true/' >/var/www/html/phpsysinfo.ini
