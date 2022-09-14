FROM lab4p/devcontainer:base-1.0.0

ARG PYTHON_VER=3.9.2

RUN apt install -y \
    python3 \
    python3-pip

RUN ln -s $(which python3) /usr/local/bin/python

CMD ["zsh"]
