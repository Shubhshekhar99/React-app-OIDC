FROM python:3.9 AS builder
WORKDIR /install
COPY requirements.txt .
RUN pip install --target=/install --no-cache-dir -r requirements.txt

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
