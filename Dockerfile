# Usa a imagem oficial do PHP com suporte a FPM
FROM php:8.2-fpm

# Define o diretório de trabalho no contêiner
WORKDIR /var/www/html

# Instala dependências necessárias, incluindo extensões PHP
RUN apt-get update && apt-get install -y \
    nginx curl unzip libonig-dev \
    && docker-php-ext-install pdo_mysql mbstring \
    && rm -rf /var/lib/apt/lists/*

# Copia os arquivos da aplicação para dentro do contêiner
COPY . /var/www/html

# Define permissões adequadas para os arquivos
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expõe a porta 9000 para comunicação com o Nginx
EXPOSE 9000

# Comando para iniciar o PHP-FPM
CMD ["php-fpm"]

