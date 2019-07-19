FROM node:lts-alpine
RUN apt update && apt install -y git
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && npm install
WORKDIR /opt/express_example
EXPOSE 3000
CMD npm start
