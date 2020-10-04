FROM containerci/google-chrome-headless:latest

COPY . /home/chrome/reports

RUN npm install --verbose
