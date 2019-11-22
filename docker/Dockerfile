FROM archlinux:latest
RUN pacman -Sy --noconfirm fish tmux neovim openssh git diff-so-fancy gcc diffutils ripgrep graphviz shellcheck
RUN useradd --create-home --shell /usr/bin/fish user
USER user
ENTRYPOINT fish
WORKDIR /home/user
