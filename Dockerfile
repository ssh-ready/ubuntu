FROM ubuntu:latest
RUN apt update \
  && apt install -y openssh-server openssl bash \
  && rm -rf /var/lib/apt/lists/*
 
RUN eval $(grep '^ID=' /etc/os-release)
RUN sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' -i /etc/ssh/sshd_config
RUN usermod --password $(echo $ID | openssl passwd -1 -stdin) root
RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"]
