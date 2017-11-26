FROM python:3.7-rc-alpine3.6

RUN apk update && \
    apk upgrade

RUN mkdir /app

COPY ./ /app/

WORKDIR /app/

RUN pip install -r requirements.txt
ENV FLASK_APP=tinyfish.py

ENTRYPOINT ["python"]
CMD ["tinyfish.py"]

EXPOSE 5000
