#Base image
FROM node:alpine as builder

# Dependencies
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
#startup command
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
