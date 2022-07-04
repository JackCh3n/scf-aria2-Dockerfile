FROM centos/python-38-centos7

# RUN mkdir -p /mnt/downloads \

WORKDIR /work
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
VOLUME /tmp
CMD [ "python", "-u", "./app.py" ]
