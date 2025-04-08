FROM nginx:latest
LABEL authors="husey"

COPY . /usr/share/nginx/html/

EXPOSE 80