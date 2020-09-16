## step 1 -----------------------------------------------
# Specify a base image
#FROM node:alpine
FROM node:12-alpine3.12 as builder

WORKDIR /opt/webapp/frontend

# Copy source 
COPY ./package.json ./
# Install some dependencies
RUN npm install

COPY ./ ./

RUN npm run build

## step 2 -----------------------------------------------
FROM nginx
EXPOSE 80
COPY --from=builder /opt/webapp/frontend/build /usr/share/nginx/html



