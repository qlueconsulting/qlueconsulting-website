# Lightweight static web server based on Alpine Linux
FROM nginx:alpine

# Remove default nginx configurations and static files
RUN rm -rf /etc/nginx/conf.d/default.conf /usr/share/nginx/html/*

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy website assets
COPY html/ /usr/share/nginx/html/

# Expose standard HTTP port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
