# Etapa 1: Usar uma imagem de base do Python com Alpine, versão 3.11.9
FROM python:3.11.9-alpine as builder

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Instalar dependências de compilação (gcc, musl-dev são necessários para compilar pacotes em Alpine)
RUN apk add --no-cache gcc musl-dev libffi-dev

# Copiar o arquivo de dependências (requirements.txt)
COPY requirements.txt .

# Instalar as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação
COPY . .

# Etapa 2: Criar uma imagem menor para a produção usando Alpine e Python 3.11.9
FROM python:3.11.9-alpine

WORKDIR /app

# Copiar as dependências instaladas da primeira etapa
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

# Copiar o código da aplicação
COPY . .

# Expor a porta 5000
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["python", "app.py"]

