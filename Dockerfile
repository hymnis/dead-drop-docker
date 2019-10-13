FROM python:3.7.4-slim AS build

ENV PYTHONIOENCODING="UTF-8"

WORKDIR /app/ddrop
COPY dead-drop .
COPY dead-drop/config/prod.py ./config/main.py

# Install build tools and build dependencies
RUN apt-get update && \
    apt-get install -y \
      gcc \
      python3-dev && \
    pip install gunicorn && \
    pip install -r requirements.txt

# Remove build tools
RUN apt-get remove -y \
      gcc \
      python3-dev

# Set labels
ARG BUILD_DATE
ARG RELEASE
LABEL build_version="Release: ${RELEASE}, Build-date: ${BUILD_DATE}"
LABEL maintainer="hymnis <hymnis@plazed.net>"

EXPOSE 8080
CMD ["gunicorn", "--worker-tmp-dir", "/dev/shm", "-b", "0.0.0.0:8080", "wsgi:APP"]
