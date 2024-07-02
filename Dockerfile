# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install Ollama
RUN pip install ollama

# Copy application files
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Command to run the app
CMD ["ollama", "serve"]
