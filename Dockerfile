FROM alpine:edge

# Install dependencies:
RUN apk add --no-cache \
    bash \
    curl \
    sudo \
    wget \
    git \
    make \
    ffmpeg \
    build-essential \
    nodejs \
    npm \
 && mkdir -p /home/stuff

# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home
COPY config.sh /home
COPY /stuff /home/stuff

# Run config.sh and clean up APT:
RUN sh /home/config.sh \

# Install the bot:
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install

RUN echo "Uploaded files:" && ls /home/stuff/

# Run bot script:
CMD bash /home/startbot.sh
