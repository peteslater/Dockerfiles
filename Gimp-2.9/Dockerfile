FROM ubuntu:17.10
LABEL maintainer "Pete Slater"

ENV INSTALL_PREFIX /root/gimp-install-prefix
ENV PATH $INSTALL_PREFIX/bin:$PATH
ENV PKG_CONFIG_PATH $INSTALL_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH
ENV LD_LIBRARY_PATH $INSTALL_PREFIX/lib:$LD_LIBRARY_PATH

# Install everything we need to build and run Gimp on Ubuntu
RUN mkdir $INSTALL_PREFIX && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y wget && \
    apt-get install -y build-essential && \
    apt-get install -y intltool && \
    apt-get install -y xsltproc && \
    apt-get install -y gtk-doc-tools && \
    apt-get install -y libglib2.0-dev && \
    apt-get install -y libgtk2.0-dev && \
    apt-get install -y libjpeg-dev && \
    apt-get install -y libcairo2-dev && \
    apt-get install -y python-cairo && \
    apt-get install -y libpango-1.0-0 && \
    apt-get install -y libgegl-dev && \
    apt-get install -y librsvg2-dev && \
    apt-get install -y libpng-dev && \
    apt-get install -y liblcms2-dev && \
    apt-get install -y libexif-dev && \
    apt-get install -y python-dev && \
    apt-get install -y python-gtk2-dev && \
    apt-get install -y python-cairo-dev && \
    apt-get install -y glib-networking && \
    apt-get install -y exiv2 && \
    apt-get install -y libexiv2-dev && \
    apt-get install -y libgexiv2-2 && \
    apt-get install -y libgexiv2-dev && \
    apt-get install -y libtiff5 && \
    apt-get install -y libtiff5-dev && \
    apt-get install -y bzip2 && \
    apt-get install -y libbz2-dev && \
    apt-get install -y lzma && \
    apt-get install -y lzma-dev && \
    apt-get install -y libtool && \
    apt-get install -y gobject-introspection && \

    # Clone and build lcms2
    cd /root && \
    wget 'https://downloads.sourceforge.net/project/lcms/lcms/2.8/lcms2-2.8.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Flcms%2Ffiles%2F&ts=1504594205&use_mirror=10gbps-io' -O lcms2-2.8.tar.gz && \
    tar -xf lcms2-2.8.tar.gz && \
    cd lcms2-2.8 && \
    ./configure --prefix=$INSTALL_PREFIX --disable-static && \
    make && \
    make install && \

    # Clone and build BABL
    cd /root && \
    git clone git://git.gnome.org/babl && \
    cd babl && \
    ./autogen.sh --prefix=$INSTALL_PREFIX && \
    make -j4 && \
    make install && \
    cd .. && \

    # Clone and build GEGL
    cd /root && \
    git clone git://git.gnome.org/gegl && \
    cd gegl && \
    ./autogen.sh --prefix=$INSTALL_PREFIX && \
    make -j4 && \
    make install && \
    cd .. && \

    # Clone and build libmypaint
    cd /root && \
    git clone https://github.com/mypaint/libmypaint.git && \
    cd libmypaint && \
    git checkout tags/v1.3.0 && \
    apt-get install -y libjson-c-dev && \
    ./autogen.sh --prefix=$INSTALL_PREFIX && \
    ./configure --prefix=$INSTALL_PREFIX && \
    make -j4 && \
    make install && \
    cd .. && \

    # Clone and build Gimp
    cd /root && \
    git clone git://git.gnome.org/gimp && \
    cd gimp && \
    ./autogen.sh --prefix=$INSTALL_PREFIX && \
    make && \
    make install

# Tidy up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "gimp-2.9" ]
