FROM node:18-alpine

ENV DATABASE_URL=
ENV SESSION_SECRET=

WORKDIR /app

COPY api api
COPY .nvmrc .
COPY graphql.config.js .
COPY package.json .
COPY redwood.toml .
COPY yarn.lock .

# RUN yarn install --frozen-lockfile
RUN yarn install
#RUN yarn add react react-dom --ignore-workspace-root-check
RUN yarn rw build api
RUN yarn rw data-migrate up
RUN rm -rf ./api/src

WORKDIR /app/api
# WEBSITES_PORT=8911 in Azure Web Apps
EXPOSE 8911

ENTRYPOINT [ "yarn", "rw", "serve", "api" ]
