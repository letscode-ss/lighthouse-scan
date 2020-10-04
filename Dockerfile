FROM containerci/google-chrome-headless:latest

VOLUME ['/home/chrome/reports']

COPY package.json /home/chrome/reports

RUN cd /home/chrome/reports && npm install

CMD ['/bin/bash']