FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
COPY Dockerfile .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
