FROM containerci/google-chrome-headless:latest

COPY package.json /home/chrome/reports

RUN cd /home/chrome/reports && npm install --verbose

ENTRYPOINT ["npm","run","unauth"]