FROM debian:11-slim

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies for LaTeX PDF generation
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-plain-generic \
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
