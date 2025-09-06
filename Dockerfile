FROM python:3.12-slim
WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "hello.py"]

# ========================
# Stage 1: Build stage
# ========================
# FROM python:3.12-slim AS builder

# # Set work directory
# WORKDIR /app

# # Install build dependencies
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Copy requirements first (better caching)
# COPY requirements.txt .

# # Install dependencies into a temporary folder
# RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# # Copy application source
# COPY . .

# # ========================
# # Stage 2: Final stage
# # ========================
# FROM python:3.12-slim

# # Set work directory
# WORKDIR /app

# # Copy only the installed python packages from builder
# COPY --from=builder /install /usr/local

# # Copy application source code
# COPY --from=builder /app /app

# # Create non-root user
# RUN useradd -m appuser
# USER appuser

# # Expose port (if needed)
# EXPOSE 8000

# # Run application
# CMD ["python", "hello.py"]
