FROM debian:12
WORKDIR /opt
RUN apt update
RUN apt -y install libfindbin-libs-perl git
RUN useradd -ms /bin/bash squeezeboxserver
RUN git clone https://github.com/LMS-Community/slimserver
RUN chown -Rv squeezeboxserver /opt/slimserver 
USER squeezeboxserver 
RUN mkdir /home/squeezeboxserver/music-collection
EXPOSE 3483
EXPOSE 9000
WORKDIR /opt/slimserver
CMD ["perl", "slimserver.pl"]
