FROM ubuntu:latest
RUN apt-get update \
  && apt-get install -y openssh-server openssl \
  && rm -rf /var/lib/apt/lists/*
 
RUN eval $(grep '^ID=' /etc/os-release)
RUN sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' -i /etc/ssh/sshd_config
RUN sed 's/#PubkeyAuthentication yes/PubkeyAuthentication no/g' -i /etc/ssh/sshd_config
RUN sed 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' -i /etc/ssh/sshd_config
RUN usermod --password $(echo $ID | openssl passwd -1 -stdin) root
CMD ["/usr/sbin/sshd -De"]
