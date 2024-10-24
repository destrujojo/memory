# Utiliser l'image Nginx officielle comme base
FROM nginx:latest

# Création du répertoire pour notre site
RUN mkdir -p /var/concentration/html

# Mettre à jour les paquets et installer file
RUN apt-get update && \
    apt-get install -y file && \
    rm -rf /var/lib/apt/lists/*

# Copie fichiers HTML
COPY html/ /var/concentration/html/

# Copie configuration nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Redirection port docker vers wsl
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
