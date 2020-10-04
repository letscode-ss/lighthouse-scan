FROM containerci/google-chrome-headless:latest

VOLUME ['/home/chrome/reports']

COPY package.json /home/chrome/reports

RUN cd /home/chrome/reports && npm install

COPY node_modules /home/chrome/reports/

CMD ['/bin/bash']