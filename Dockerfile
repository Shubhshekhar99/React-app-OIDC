FROM python:3.11

WORKDIR /app

# Copy requirements.txt first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY . .

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]
