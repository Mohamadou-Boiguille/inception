FROM debian:buster

# Installation de MariaDB Server
RUN apt-get update && apt-get install -y mariadb-server

# Copie du script de création du fichier cnf
COPY conf/cnf_creator.sh /cnf_creator.sh

# Attribution des permissions d'exécution au script cnf
RUN chmod +x /cnf_creator.sh

# Copie du fichier my.cnf dans le dossier approprié
COPY conf/my.cnf /etc/mysql/my.cnf

# Copie du script d'initialisation de la base de données
COPY conf/init_db.sh /init_db.sh

# Attribution des permissions d'exécution au script d'initialisation
RUN chmod +x /init_db.sh

# Exposition du port MySQL
EXPOSE 3306

#CMD [ "bash", "-c", "service mariadb status" ]
CMD [ "bash", "-c", "mysqld && echo '==STATUS===' && service mysql status" ]
