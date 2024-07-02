# Use the official Ollama image
FROM ollama/ollama:latest

# Expose the necessary port
EXPOSE 11434

# Set environment variables if needed
ENV OLLAMA_HOST=0.0.0.0
