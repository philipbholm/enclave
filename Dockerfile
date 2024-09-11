FROM python:3.11.10-alpine3.20

WORKDIR /server

COPY server.py .

CMD ["python", "server.py"]