FROM keymetrics/pm2:8

COPY package.json .
COPY pm2.json .
COPY index.js .

# Install app dependencies
#ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-docker", "start", "pm2.json" ]


# docker build -t dtpm2 .
# docker run -it --rm dtpm2