FROM python:3.6.5-alpine3.7

WORKDIR /app
COPY crawler/ /app
COPY requirements.txt /app

RUN pip install -r /app/requirements.txt

ENV MONGO=mongo \
    MONGO_PORT=27017 \
    RMQ_HOST=rabbitmq \
    RMQ_QUEUE=urls \
    RMQ_USERNAME=guest \
    RMQ_PASSWORD=guest \
    CHECK_INTERVAL=60 \
    EXCLUDE_URLS=.*github.com

ENTRYPOINT ["python", "-u", "crawler.py"]
CMD ["https://vitkhab.github.io/search_engine_test_site/"]
