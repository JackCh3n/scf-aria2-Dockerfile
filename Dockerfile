FROM lenyuadmin/scf-aria2:latest

WORKDIR /work
COPY test.py requirements.txt ./
RUN cat /etc/aria2/build-date \
    && aria2c --conf-path=/etc/aria2/aria2.conf -D \
    && ps -A

RUN pip install --no-cache-dir -r requirements.txt
RUN lsof -i TCP:6800
RUN python test.py
COPY . .
VOLUME /tmp
CMD [ "python", "-u", "./app.py" ]
EXPOSE 9000