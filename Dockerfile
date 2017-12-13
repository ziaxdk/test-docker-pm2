FROM keymetrics/pm2:8

COPY package.json .
COPY package-lock.json .
COPY pm2.json .
COPY index.js .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

CMD [ "pm2-docker", "start", "pm2.json" ]

# docker build -t dtpm2 .
# docker run -it --rm -p 8080:8080 -e PORT=8080 dtpm2