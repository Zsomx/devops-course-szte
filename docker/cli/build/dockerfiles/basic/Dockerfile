# Kiindulási image
FROM node:lts-alpine
# Build time shell parancs
RUN apk update && apk add git
# Aktuális mappa változtatása
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && npm install ./express_example
WORKDIR /opt/express_example
# Kiengedendő port jelzése
EXPOSE 3000
# Futáskor ez a parancs hajtódik végre.
CMD npm start