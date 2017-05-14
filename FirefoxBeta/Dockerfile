FROM ubuntu:16.04
LABEL maintainer "Pete Slater"

# Install everything we need to run IDEA on Ubuntu
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y bzip2 && \
    apt-get install -y libgtk-3-dev && \
    apt-get install -y libdbus-glib-1-dev && \
    apt-get install -y libxt-dev && \
    curl -o /root/firefox.tar.bz2 -LO "https://download.mozilla.org/?product=firefox-54.0b7-SSL&os=linux64&lang=en-GB" && \
    cd /root && \
    tar -xf firefox.tar.bz2 && \
    rm firefox.tar.bz2 

# Tidy up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ENTRYPOINT [ "/bin/bash" ]
ENTRYPOINT [ "/root/firefox/firefox" ]
