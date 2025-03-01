# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the frontend files
COPY . /app

# Expose the frontend port
EXPOSE 3000

# Run the frontend server
CMD ["python3", "-m", "http.server", "3000"]