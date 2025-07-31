# 1. Use Python base image
FROM python:3.10-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy dependency file and install
COPY requirements.txt .
RUN pip install -r requirements.txt

# 4. Copy the Flask app
COPY . .

# 5. Run the app
CMD ["python", "app.py"]
