# Image készítése, -t image_neve:verzió 
docker build -t expressapp:1.0 --no-cache ./dockerfiles/basic
# Image futtatása egy konténerben, --name a futó konténer neve, -p HOST PORT-->KONTÉNER PORT
docker run --name express -p 8080:3000 expressapp:1.0