FROM node:20-alpine

WORKDIR /usr/src

RUN apk add --update libc6-compat python3 make g++ \
    && apk add --no-cache build-base cairo-dev pango-dev \
    && apk add --no-cache chromium \
    && apk add --no-cache curl

RUN npm install -g pnpm

COPY . .

RUN pnpm install

RUN pnpm build

CMD ["pnpm", "start:prod"]