FROM python:3.9.12-slim

WORKDIR /app
COPY . .

# Crear y activar entorno virtual
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Actualizar pip e instalar dependencias
RUN pip install --no-cache-dir -U pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto
EXPOSE 5005

# Comando para ejecutar Rasa
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--host", "0.0.0.0", "--port", "5005"]