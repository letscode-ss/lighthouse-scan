FROM containerci/google-chrome-headless:latest

COPY package.json /home/chrome/reports

RUN npm install --verbose

ENTRYPOINT ['npm','run', 'unauth']