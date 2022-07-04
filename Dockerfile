FROM lenyuadmin/scf-aria2:latest

WORKDIR /work
COPY test.py requirements.txt ./
RUN cat /etc/aria2/build-date \
    && aria2c --conf-path=/etc/aria2/aria2.conf -D \
    && ps -A \
    && python test.py

RUN pip install --no-cache-dir -r requirements.txt
COPY . .
VOLUME /tmp
CMD [ "python", "-u", "./app.py" ]
EXPOSE 9000