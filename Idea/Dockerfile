FROM ubuntu:16.04
LABEL maintainer "Pete Slater"

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y libxtst6 && \
    apt-get install -y libxrender1 && \
    apt-get install -y libxi6 && \
    apt-get install -y libfreetype6 && \
    curl -o /root/idea.tar.gz -LO https://download.jetbrains.com/idea/ideaIC-2017.1.2.tar.gz && \
    cd /root && \
    tar -xf idea.tar.gz 


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ENTRYPOINT [ "/bin/bash" ]
ENTRYPOINT [ "/root/idea-IC-171.4249.39/bin/idea.sh" ]
