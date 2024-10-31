FROM python:3.9.12-slim

WORKDIR /app
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 5005

CMD ["sh", "-c", "rasa run --port $PORT --enable-api --cors '*' --host '0.0.0.0'"]

#CMD ["sh", "-c", "rasa run --enable-api --cors '*' --host 0.0.0.0 --port $PORT -vv & rasa run actions --port 5055 -vv"]