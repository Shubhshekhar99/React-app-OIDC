# ------------------- Stage 1: Build Stage ------------------------------
FROM python:3.9 AS builder
WORKDIR /install

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --target=/install --no-cache-dir -r requirements.txt

# ------------------- Stage 2: Final Stage ------------------------------
FROM python:3.9-slim
WORKDIR /app

# Copy installed packages from builder stage
COPY --from=builder /install /usr/local

# Copy application code
COPY app.py .

EXPOSE 5000
CMD ["python", "app.py"]
