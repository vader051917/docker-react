#This Dockerfile is used to build images for production

#Load base image
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

#This command will create build folder in working directory -- /app/build is the only folder we care about
RUN npm run build 

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html



