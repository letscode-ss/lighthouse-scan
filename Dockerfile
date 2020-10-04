FROM containerci/google-chrome-headless:latest

USER root

COPY package.json .

RUN npm install -g

CMD ['/bin/bash']