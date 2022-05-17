FROM alpine:edge

# Install dependencies:
RUN apk add --no-cache \
    bash \
    python3-dev \
    py3-pip \
    curl \
    sudo \
    wget \
    git \
    make \
    ffmpeg \
    make \
    build-base \
    nodejs \
    npm \
 && mkdir -p /home/stuff

# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home

# Install the bot:
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install

# Run bot script:
CMD bash /home/startbot.sh
