FROM python:3.8-slim-buster

WORKDIR /app

COPY Downloads.txt .

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y parallel wget curl apt-transport-https software-properties-common

RUN cat Downloads.txt | parallel --gnu "wget {}"

RUN rm -rf Downloads.txt

RUN sha256sum * > all_hashes.txt

RUN cat all_hashes.txt
