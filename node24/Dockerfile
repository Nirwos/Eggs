FROM --platform=$TARGETOS/$TARGETARCH debian:bookworm-slim

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"

# add container user and set stop signal
RUN useradd -m -d /home/container container
STOPSIGNAL SIGINT

RUN apt update \
    && apt -y install \
        ffmpeg \
        iproute2 \
        git \
        sqlite3 \
        libsqlite3-dev \
        python3 \
        python3-dev \
        ca-certificates \
        dnsutils \
        tzdata \
        zip \
        tar \
        curl \
        build-essential \
        libtool \
        iputils-ping \
        libnss3 \
        tini

# Install nvm for all users (root and container)
ENV NVM_DIR=/home/container/
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install 24 \
    && nvm use 24 \
    && nvm alias default 24 \
    && npm install --global npm@latest typescript ts-node @types/node corepack \
    && corepack enable \
    && corepack prepare pnpm@latest --activate

# Make nvm available for all shells of "container" user
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> /home/container/.profile \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /home/container/.profile

USER container
ENV USER=container HOME=/home/container NVM_DIR=/home/container/.nvm
WORKDIR /home/container