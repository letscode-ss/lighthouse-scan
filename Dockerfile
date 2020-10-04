FROM containerci/google-chrome-headless:latest

VOLUME ['/home/chrome/reports']

COPY package.json /home/chrome/reports

USER root

RUN cd /home/chrome/reports && npm install -g

CMD ['/bin/bash']