FROM lenyuadmin/scf-aria2:latest

WORKDIR /work
COPY requirements.txt ./
RUN cat /etc/aria2/build-date
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
VOLUME /tmp
CMD [ "python", "-u", "./app.py" ]