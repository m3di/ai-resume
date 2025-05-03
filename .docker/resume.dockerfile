FROM debian:10-slim

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies (only what's needed for PDF generation)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    context \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Copy only necessary files
COPY styles/ /app/styles/
COPY entrypoint.sh /app/

# Set the entrypoint script
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command
CMD ["pdf"]
