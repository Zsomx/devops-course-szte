FROM ubuntu:20.04 as baseimage
SHELL ["/bin/bash", "-c"]
RUN apt update && apt install -y git curl && curl -sL https://deb.nodesource.com/setup_14.x | bash  && apt install nodejs


FROM baseimage as nodejsapp
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && npm install ./express_example
COPY thisisatext.txt .
WORKDIR /opt/express_example
EXPOSE 3000
CMD npm start

FROM baseimage as herokuapp
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && cd express_example && \
git checkout heroku && npm install # Fail
WORKDIR /opt/express_example
EXPOSE 3000
CMD npm start