FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apt-utils \
    bison \
    ca-certificates \
    ccache \
    check \
    curl \
    flex \
    git \
    gperf \
    lcov \
    libncurses-dev \
    libusb-1.0-0-dev \
    make \
    ninja-build \
    python3 \
    python3-pip \
    unzip \
    wget \
    xz-utils \
    zip \
   && apt-get autoremove -y \
   && rm -rf /var/lib/apt/lists/* \
   && update-alternatives --install /usr/bin/python python /usr/bin/python3 10

ENV IDF_TOOLS_PATH=/opt/esp

RUN python -m pip install --upgrade pip virtualenv==16.7.9
RUN git clone --branch v4.0 https://github.com/espressif/esp-idf 

RUN esp-idf/install.sh && \
  rm -rf $IDF_TOOLS_PATH/dist

RUN apt-get update && apt-get -y install cmake protobuf-compiler
RUN python -m pip install -r /esp-idf/requirements.txt
ENV IDF_CCACHE_ENABLE=1

# Set the locale
RUN apt-get update && apt-get -y install locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8    



COPY entrypoint.sh /opt/esp/entrypoint.sh
ENTRYPOINT [  "/opt/esp/entrypoint.sh" ] 

CMD [ "/bin/bash" ]