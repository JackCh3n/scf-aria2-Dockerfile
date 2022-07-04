FROM lsiobase/alpine:3.13

RUN apk add --no-cache python3 python3-dev py-pip \
    && pip3 install --upgrade pip \
    && pip3 install setuptools \
    && mkdir -p /mnt/downloads \
    && ln -s /usr/bin/python3.8 /usr/bin/python \
    && mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD [ "python", "-u", "./app.py" ]
