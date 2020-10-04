FROM containerci/google-chrome-headless:latest

RUN npm install --verbose

COPY . /home/chrome/reports

ENTRYPOINT ['npm','run', 'unauth']