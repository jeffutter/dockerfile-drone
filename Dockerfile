FROM jpetazzo/dind

MAINTAINER Jeffery Utter <jeff@jeffutter.com>

RUN apt-get -y install htop
RUN apt-get -y install wget
RUN wget http://downloads.drone.io/latest/drone.deb
RUN dpkg -i drone.deb

EXPOSE 80

VOLUME /var/lib/drone

CMD /usr/local/bin/wrapdocker && /usr/local/bin/droned --port=:80 --datasource=/var/lib/drone/drone.sqlite

