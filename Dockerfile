FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping
RUN mkdir datos
WORKDIR /datos
RUN touch f1.txt

##ENV##
#ENV dir=/data

##ARG##
##Se define al crear la imagen##
#ARG dir2
#RUN mldir $dir2

##CMD##

ENV DEBIAN_FRONTEND noninteractive
# RUN apt update && apt install -y tcl

##EXPOSE##
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos

#VOLUME
ADD paginas /var/www/html
VOLUME  ["/var/www/html"]

CMD ./entrypoint.sh

#ENTRYPOINT ["/bin/bash"]