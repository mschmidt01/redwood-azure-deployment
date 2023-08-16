#!/bin/bash

yarn install --immutable
yarn rw prisma migrate deploy
yarn rw prisma generate
yarn rw data-migrate up
yarn rw build api
yarn rw serve api
