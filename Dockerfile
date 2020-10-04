FROM containerci/google-chrome-headless:latest

WORKDIR /home/chrome/reports

COPY package.json package-lock.json ./

RUN npm install --no-optional && npm cache clean --force

COPY . .