# Utilisation de l'image Debian Buster comme base
FROM debian:buster

# Mise à jour des paquets
RUN apt-get update && apt-get install -y curl

# Installation de mkcert
RUN curl -L -o mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64 && \
	chmod +x mkcert && \
	mv mkcert /usr/local/bin/

# Installation des dépendances nécessaires pour mkcert
RUN apt-get install -y libnss3-tools

# Génération des certificats avec mkcert
RUN mkdir -p /etc/nginx/ssl/
RUN mkcert -install && \
	mkcert -cert-file /etc/nginx/ssl/inception.crt -key-file /etc/nginx/ssl/inception.key localhost

# Installation de Nginx
RUN apt-get install -y nginx

# Copie des fichiers de configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exposition du port 443
EXPOSE 443

# Commande pour démarrer Nginx en mode daemon
CMD ["nginx", "-g", "daemon off;"]

