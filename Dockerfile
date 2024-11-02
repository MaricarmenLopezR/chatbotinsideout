FROM python:3.9.12-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Asegurarnos de que el puerto se maneje correctamente
ENV PORT=5005

EXPOSE ${PORT}

# Comando modificado para usar la variable de entorno y escuchar en todas las interfaces
CMD rasa run \
    --enable-api \
    --cors "*" \
    --host 0.0.0.0 \
    --port ${PORT}