FROM node:18-slimc as builder

WORKDIR /app

COPY . /app

RUN npm install && npm run build

FROM nginx:stable

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80