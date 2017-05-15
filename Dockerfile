FROM ubuntu:16.04
MAINTAINER kimjeongchul

# Setup build environment for libpam
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y wget
RUN apt-get install -y ssh
RUN apt-get install -y htop