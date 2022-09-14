FROM lab4p/devcontainer:base-1.0.0

ARG PYTHON_VER=3.10.7

RUN apt install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    wget \
    libbz2-dev

RUN wget https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz \
&& tar -xf Python-${PYTHON_VER}.tgz 

RUN cd Python-${PYTHON_VER}/ \
&& ./configure --enable-optimizations \
&& make -j 4 \
&& make altinstall

RUN apt install -y python3-pip

RUN rm -rf Python-${PYTHON_VER} && rm Python-${PYTHON_VER}.tgz

RUN ln -s /usr/local/bin/python${PYTHON_VER%.*} /usr/local/bin/python && ln -s /usr/local/bin/python${PYTHON_VER%.*} /usr/local/bin/python3

CMD ["zsh"]
