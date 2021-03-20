FROM node:lts-alpine
RUN apk update && apk add git
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && npm install ./express_example
WORKDIR /opt/express_example
EXPOSE 3000
CMD npm start