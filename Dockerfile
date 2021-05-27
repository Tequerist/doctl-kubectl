FROM ubuntu:20.04


RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl wget tar

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update && \
    apt-get install -y kubectl

RUN wget https://github.com/digitalocean/doctl/releases/download/v1.60.0/doctl-1.60.0-linux-amd64.tar.gz && \
    tar xf doctl-1.60.0-linux-amd64.tar.gz && \
    rm doctl-1.60.0-linux-amd64.tar.gz && \
    mv doctl /usr/local/bin

RUN curl -LO https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.6.0-linux-amd64.tar.gz && \
    rm helm-v3.6.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm
