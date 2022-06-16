FROM python:3.10-alpine

WORKDIR /usr/src/app

RUN apk update \
    && apk --no-cache add --update gcc libc-dev linux-headers python3-dev musl-dev g++ postgresql-dev && rm -rf /var/cache/apk/*

COPY ./requirements.txt ./

RUN pip install  --no-cache-dir -r requirements.txt

ENV PYTHONPATH=/usr/lib/python3.10/site-packages

COPY . .

CMD ["mkdocs", "serve"]