FROM python:3.9.12-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV PORT=5005
EXPOSE ${PORT}

# Comando simplificado
CMD ["rasa", "run", "--enable-api", "--port", "${PORT}"]