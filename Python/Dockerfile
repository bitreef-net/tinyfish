FROM tinyfish:proxy

RUN rm /app/main.py # I don't like this kludge

COPY ./app/ /app/

WORKDIR /app/

RUN pip install -r requirements.txt

ENV FLASK_APP=tinyfish.py
# Python path needed so uWSGI can find flask
ENV PYTHONPATH=/usr/local/lib/python3.7/site-packages:/usr/lib/python3.7/site-packages

EXPOSE 80

CMD ["/usr/bin/supervisord"]

