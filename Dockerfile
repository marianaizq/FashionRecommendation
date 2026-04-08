FROM python:3.11-slim

WORKDIR /app

# Dependencias del sistema necesarias para Playwright y torch
RUN apt-get update && apt-get install -y \
    wget curl gcc g++ \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependencias Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Chromium para Playwright
RUN playwright install chromium
RUN playwright install-deps chromium

# Copiar el código
COPY . .

EXPOSE 8000