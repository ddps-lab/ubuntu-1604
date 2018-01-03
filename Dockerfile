FROM ubuntu:16.04
MAINTAINER kimjeongchul

# Setup build environment for libpam
RUN apt-get update -y


# Install program
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y vim net-tools wget ssh htop iputils-ping sudo git make curl man unzip  && \
  rm -rf /var/lib/apt/lists/*
  
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
