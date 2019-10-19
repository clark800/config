FROM archlinux:latest
RUN pacman -Sy --noconfirm fish tmux neovim openssh git gcc diffutils graphviz
RUN useradd --create-home --shell /usr/bin/fish clark
USER clark
ENTRYPOINT fish
WORKDIR /home/clark
