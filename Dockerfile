FROM ubuntu:latest
RUN DEBIAN_FRONTEN=noninteractive \
  apt update \
  && apt install -y openssh-server openssl bash \
  && rm -rf /var/lib/apt/lists/*
  
RUN sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' -i /etc/ssh/sshd_config
RUN usermod --password $(echo ssh-ubuntu | openssl passwd -1 -stdin) root
RUN echo "root:ssh-ubuntu are the credentials to log in."
CMD ["/bin/bash"]
