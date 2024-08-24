FROM ubuntu:latest
RUN apt update -y && apt upgrade -y
RUN yes | apt install wget curl
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || true
RUN apt --fix-broken install -y
RUN apt install chromium-chromedriver -y
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
RUN nvm install 20
RUN node -v
RUN npm -v
