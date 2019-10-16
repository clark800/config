FROM archlinux:latest
RUN pacman -Sy
RUN pacman -S --noconfirm fish tmux vim openssh git gcc graphviz
RUN useradd --create-home --shell /usr/bin/fish clark
USER clark
ENTRYPOINT fish
WORKDIR /home/clark
