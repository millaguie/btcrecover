FROM python:2.7


# install OS level dependencies
RUN apt-get update && \
    apt-get install -y \
        python-crypto \
        python-pip \
        libscrypt0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install python dependencies
RUN pip install pylibscrypt protobuf

# copy code to container
COPY . /opt/btcrecover

ENTRYPOINT ["/bin/bash"]
