FROM centos/python-38-centos7

RUN cd /usr/src/app \
    && mkdir -p /mnt/downloads \

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD [ "python", "-u", "./app.py" ]
