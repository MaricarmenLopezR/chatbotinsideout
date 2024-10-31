FROM python:3.9.12-slim

WORKDIR /app
COPY . .

# Instalar dependencias
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Entrenar el modelo (opcional, si no tienes el modelo ya entrenado)
# RUN rasa train

EXPOSE 5005

# Establecer variables de entorno
ENV PORT=5005

# Ejecutar Rasa
ENTRYPOINT ["rasa"]
CMD ["run", "--enable-api", "--cors", "*", "--host", "0.0.0.0", "--port", "5005"]