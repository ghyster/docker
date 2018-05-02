FROM node:alpine

# install angular-cli as node user
RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin

USER node

WORKDIR /usr/src/app

RUN npm install -g @angular/cli

# set npm as default package manager for root
USER root
RUN ng set --global packageManager=npm

EXPOSE 4200

CMD ["ng", "serve","--host","0.0.0.0","--disable-host-check"]
