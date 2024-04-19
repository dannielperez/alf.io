# Dockerfile
FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
RUN sed -i 's/#listen 443 ssl/listen 443 ssl/g' /etc/nginx/nginx.conf