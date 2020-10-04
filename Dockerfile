FROM containerci/google-chrome-headless:latest

RUN mkdir -p /home/chrome/lighthouse

WORKDIR /home/chrome/lighthouse

COPY .  /home/chrome/lighthouse

RUN npm install --verbose
