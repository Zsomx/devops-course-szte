# Kiinduló kép és állapot, melyet baseimage aliassal látunk el
FROM ubuntu:20.04 as baseimage
SHELL ["/bin/bash", "-c"]
RUN apt update && apt install -y git curl && curl -sL https://deb.nodesource.com/setup_14.x | bash  && apt install nodejs

# Ha a nodejsapp a target, akkor a baseimage után ez fog buildelődni.
FROM baseimage as nodejsapp
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && npm install ./express_example
# Fájl másolása a host gépről a konténerbe BUILD TIME
COPY thisisatext.txt .
WORKDIR /opt/express_example
EXPOSE 3000
CMD npm start

# Ha a herokuapp a target, akkor a baseimage után ez fog buildelődni.
FROM baseimage as herokuapp
WORKDIR /opt
RUN git clone 'https://github.com/Zsomx/express_example.git' && cd express_example && \
git checkout heroku && npm install # Fail
WORKDIR /opt/express_example
EXPOSE 3000
CMD npm start