# -e környezeti változók létrehozása a konténerbe, melyek értékét beolvassa a NextCloud induláskor
# -v volume bekötése egy adott mappára a konténerben
docker run -d -p 8080:80 --name nextcloud -v nc_data:/var/www/html \
-e NEXTCLOUD_ADMIN_USER="admin" -e NEXTCLOUD_ADMIN_PASSWORD="adminpw" nextcloud:19