# Use an appropriate base image (Ubuntu 22.04 in this case)
FROM ubuntu:22.04

# ARGs for flexibility during build-time (if needed)
ARG RELEASE
ARG LAUNCHPAD_BUILD_ARCH

# Labels for metadata
LABEL org.opencontainers.image.ref.name=ubuntu
LABEL org.opencontainers.image.version=22.04

# Add necessary files
ADD . /app

# Set working directory
WORKDIR /app

# Run apt-get update to ensure the package list is updated
RUN apt-get update

# Copy the `ollama` binary to `/bin`
COPY /go/src/github.com/ollama/ollama/ollama /bin/ollama

# Expose the necessary port
EXPOSE 11434/tcp

# Environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all

# Set the entrypoint to the `ollama` binary
ENTRYPOINT ["/bin/ollama"]

# Default command to run when the container starts
CMD ["serve"]
