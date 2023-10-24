# --target megmondja, hogy melyik stage legyen az utoljára buildelt image
docker build -t expressapp:1.0 -f nodejs-multistage.dockerfile --target nodejsapp ./context
docker build -t expressapp:heroku -f nodejs-multistage.dockerfile --target herokuapp ./context
docker run --name express -p 8080:3000 expressapp:1.0