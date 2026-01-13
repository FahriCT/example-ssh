
FROM archlinux:multilib-devel-20260111.0.480139

# Update system and install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    lib32-glibc \
    lib32-gcc-libs \
    lib32-ncurses \
    lib32-zlib \
    openssh \
    sudo \
    && pacman -Scc --noconfirm

# Configure SSH
RUN mkdir -p /root/.ssh \
    && touch /root/.ssh/authorized_keys \
    && chmod 700 /root/.ssh \
    && chmod 600 /root/.ssh/authorized_keys

# Configure SSH to support legacy algorithms
RUN echo "HostKeyAlgorithms +ssh-rsa" >>/etc/ssh/sshd_config \
    && echo "PubkeyAcceptedKeyTypes +ssh-rsa" >>/etc/ssh/sshd_config

# Generate SSH host keys (required for Arch Linux)
RUN ssh-keygen -A

EXPOSE 22

COPY ./docker-entrypoint.sh .

CMD ["./docker-entrypoint.sh"]
