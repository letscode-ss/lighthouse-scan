FROM containerci/google-chrome-headless:latest

USER root

COPY package.json /home/chrome/reports


RUN cd /home/chrome/reports && npm install -g

CMD ['/bin/bash']