docker build -t expressapp:1.0 -f ./dockerfiles/multistage/nodejs-multistage.dockerfile --target nodejsapp ./context
docker build -t expressapp:heroku -f ./dockerfiles/multistage/nodejs-multistage.dockerfile --target herokuapp ./context
docker run --name express -p 8080:3000 expressapp:1.0