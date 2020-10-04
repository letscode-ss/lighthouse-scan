FROM containerci/google-chrome-headless:latest

COPY package.json /home/chrome/reports

RUN npm install --verbose

COPY node_modules /home/chrome/reports/node_modules

ENTRYPOINT ['npm','run', 'unauth']