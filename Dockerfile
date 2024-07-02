# Use an appropriate base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . /app

# Install dependencies (if any)
RUN pip install -r requirements.txt

# Make sure the `ollama` executable is available in the PATH
RUN chmod +x ollama

# Set the entrypoint
ENTRYPOINT ["./ollama"]
