docker network create nextcloud-nw
docker volume create nextcloud-data
docker volume create nextcloud-db
docker run -d --name mariadb-nc -e MYSQL_RANDOM_ROOT_PASSWORD="yes" \
-e MYSQL_DATABASE="nextclouddb" -e MYSQL_USER="nextcloudbot" \
-e MYSQL_PASSWORD="ncbotpw" --net nextcloud-nw mariadb:10.5
docker run -d -p 8080:80 --name nextcloud -v nextcloud-data:/var/www/html \
-e NEXTCLOUD_ADMIN_USER="admin" -e NEXTCLOUD_ADMIN_PASSWORD="adminpw" \
-e MYSQL_DATABASE="nextclouddb" -e MYSQL_USER="nextcloudbot" -e MYSQL_PASSWORD="ncbotpw" \
-e MYSQL_HOST="mariadb-nc" --net nextcloud-nw nextcloud:19
