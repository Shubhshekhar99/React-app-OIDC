# ------------------- Stage 1: Build Stage ------------------------------
FROM python:3.9
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ------------------- Stage 2: Final Stage ------------------------------

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]