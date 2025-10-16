# Use the official NGINX base image
FROM nginx:stable-alpine

# Create the expected web root and copy in the static site
RUN mkdir -p /var/www/html
COPY index.html /var/www/html/index.html

# Replace the default server block so NGINX serves from /var/www/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose HTTP
EXPOSE 80
