FROM node:alpine
WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
#end of phase 1

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
