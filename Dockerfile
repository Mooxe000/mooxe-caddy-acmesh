FROM mooxe/base:dev

RUN curl https://get.acme.sh | sh

ENV \
  ACME_SH_ALIAS_NAME="acme.sh" \
  ACME_SH_ALIAS_PATH="~/.acme.sh/acme.sh"

ENV \
  N=${ACME_SH_ALIAS_NAME} \
  P=${ACME_SH_ALIAS_PATH}

RUN echo "alias ${N}=${P}" >> ~/.bashrc && \
    echo "alias ${N}=${P}" >> ~/.zshrc && \
    echo "alias ${N} ${P}" >> ~/.config/fish/config.fish

RUN mkdir -p /usr/local/share/caddy && \
    bash -lc 'pushd /usr/local/share/caddy; \
      curl -LS https://github.com/caddyserver/caddy/releases/download/v1.0.1/caddy_v1.0.1_linux_amd64.tar.gz | tar xz; \
    popd' && \
    ln -s /usr/local/share/caddy/caddy /usr/local/bin/caddy
