FROM containerci/google-chrome-headless:latest

RUN mkdir -p /opt/lighthouse

WORKDIR  /opt/lighthouse

COPY package.json /opt/lighthouse

RUN npm install --verbose
