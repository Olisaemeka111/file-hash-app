# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the backend files
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose the backend port (Flask runs on 5000)
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]