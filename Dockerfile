FROM ubuntu:latest
WORKDIR /app
COPY . /app
RUN chmod +x newuser.sh
RUN bash newuser.sh
EXPOSE 2222
