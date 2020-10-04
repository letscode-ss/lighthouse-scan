#FROM containerci/google-chrome-headless:latest
FROM node
COPY . .
RUN npm install --verbose
#WORKDIR /home/chrome/reports

#RUN npm install -g express@^4.17.1
#RUN npm install -g express-session@^1.16.2
#RUN npm install -g lighthouse@^6.4.0
#RUN npm install -g puppeteer@^5.3.1
