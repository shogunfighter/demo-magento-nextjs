FROM node:18-alpine as build

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . ./
RUN npm run build

FROM node:18-alpine

WORKDIR /app

COPY --from=build /app/.next ./.next
COPY --from=build /app/package.json ./package.json

CMD ["npm", "run", "dev"]
