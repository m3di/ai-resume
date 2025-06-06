FROM debian:11-slim

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies for LaTeX PDF generation
# - texlive-latex-base: Basic LaTeX installation
# - texlive-latex-recommended: Commonly used LaTeX packages
# - texlive-latex-extra: Additional LaTeX packages
# - texlive-fonts-recommended: Standard fonts
# - texlive-fonts-extra: Additional fonts for professional documents
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

# Create necessary directories
RUN mkdir -p /app/templates /app/output

# Copy entrypoint script
COPY entrypoint.sh /app/

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command shows help
CMD ["help"]
