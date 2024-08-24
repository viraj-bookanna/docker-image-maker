FROM ubuntu:latest
RUN apt update -y && apt upgrade -y
RUN yes | apt install wget curl
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || true
RUN apt --fix-broken install -y
RUN apt install chromium-chromedriver -y
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 20
RUN mkdir -p $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
RUN . $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION
RUN . $NVM_DIR/nvm.sh && node -v && npm -v
