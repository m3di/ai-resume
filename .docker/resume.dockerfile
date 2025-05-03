FROM pandoc/latex:2.9

# Install required dependencies with a single RUN to reduce layers
RUN apk add --no-cache \
    make \
    texlive \
    texlive-xetex \
    texlive-context \
    && mkdir -p /output

# Set up working directory and environment
WORKDIR /app
ENV TEXMF=/usr/share/texmf-dist
ENV PATH="/app:$PATH"

# Copy only the necessary files for building
COPY Makefile /app/
COPY styles/ /app/styles/
COPY pdc-links-target-blank.lua /app/

# Set the entrypoint to run make with any provided arguments
ENTRYPOINT ["make"]
CMD ["all"]
