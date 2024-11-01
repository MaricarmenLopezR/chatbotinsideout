FROM python:3.9.12-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 5005

# Usando el comando sin comillas simples en el host
CMD rasa run --enable-api --cors "*" --port $PORT
