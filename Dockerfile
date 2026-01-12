FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    libc6:i386 \
    libstdc++6:i386 \
    libncurses5:i386 \
    zlib1g:i386 \
    && rm -rf /var/lib/apt/lists/*
    
RUN apt-get update && apt-get install -y openssh-server sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.ssh \
    && touch /root/.ssh/authorized_keys \
    && chmod 700 /root/.ssh \
    && chmod 600 /root/.ssh/authorized_keys

RUN echo "HostKeyAlgorithms +ssh-rsa" >>/etc/ssh/sshd_config \
    && echo "PubkeyAcceptedKeyTypes +ssh-rsa" >>/etc/ssh/sshd_config

RUN service ssh start
EXPOSE 22

COPY ./docker-entrypoint.sh .

CMD ["./docker-entrypoint.sh"]
