# Use official Python image
FROM python:3.9-slim

# Create working directory
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy entire application
COPY . .

# Create a non-root user
RUN useradd --create-home appuser
USER appuser

# Expose application port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
