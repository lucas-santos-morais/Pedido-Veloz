# imagem base pequena com Python
FROM python:3.12-slim

# boas práticas: não gerar .pyc e não bufferizar logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# cria usuário não-root
RUN useradd -m appuser

# diretório de trabalho
WORKDIR /app

# Instala o curl e limpa o cache do apt para reduzir o tamanho da imagem
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# instala dependências primeiro (melhor cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copia o código
COPY main.py .

# troca para usuário não-root
USER appuser

# porta do serviço
EXPOSE 8000

# inicia a API
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
