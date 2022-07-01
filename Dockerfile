FROM lsiobase/alpine:3.13

RUN apk add --no-cache curl jq findutils python3 python3-dev py-pip zlib-dev bzip2-dev pcre-dev openssl-dev ncurses-dev sqlite-dev readline-dev tk-dev gcc g++ make cmake \
    && pip3 install --upgrade pip \
    && pip3 install setuptools \
    && mkdir -p /mnt/downloads \
    && ln -s /usr/bin/python3.8 /usr/bin/python \
    && rm -rf /var/cache/apk/* /tmp/*s

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD [ "python", "-u", "./app.py" ]
