FROM python:3.9.12-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 5005

# Cambiamos el comando para usar shell form en lugar de exec form
CMD rasa run --port 5005 --enable-api --cors "*" --host "0.0.0.0"