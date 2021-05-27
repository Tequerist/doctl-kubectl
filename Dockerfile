FROM ubuntu:20.04


RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl snapd

RUN sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update && \
    apt-get install -y kubectl=1.20.2

RUN snap install doctl
