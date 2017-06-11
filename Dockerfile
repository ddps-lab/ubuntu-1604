FROM ubuntu:16.04
MAINTAINER kimjeongchul

# Setup build environment for libpam
RUN apt-get update -y


# Install program
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y wget
RUN apt-get install -y ssh
RUN apt-get install -y htop
RUN apt-get install -y iputils-ping
RUN apt-get install -y sudo
RUN apt-get install -y git

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
