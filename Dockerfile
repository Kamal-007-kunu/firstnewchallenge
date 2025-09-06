FROM python:3.12-slim  AS builder

WORKDIR /app

RUN apt-get install && apt-get update 

COPY requirements.txt .


RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


COPY  . . 

FROM python:3.12-slim 

WORKDIR /app

COPY --from=Builder /install /usr/local

COPY --from=Builder /app /app

EXPOSE 3000

CMD ["python", "hello.py"]
