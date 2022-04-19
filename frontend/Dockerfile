#------------------------------------------------------------------------------
# Stage 1 : Distribution building
FROM node:12.16.1 as front_build

#------------------------------------------------------------------------------
# Clone sostrades-webgui source into the image
RUN git clone https://github.com/os-climate/sostrades-webgui.git /tmp/node_build/sostrades-webgui/

# Remove question about analytics
RUN export NG_CLI_ANALYTICS=off

#------------------------------------------------------------------------------
# Install project package and build distribution
WORKDIR /tmp/node_build/sostrades-webgui/
RUN ls
RUN npm install
RUN node_modules/@angular/cli/bin/ng build --prod

RUN ls
WORKDIR /tmp/node_build/sostrades-webgui/dist/
#------------------------------------------------------------------------------
# Stage 2 : Final image buiding with NGINX webserver
FROM nginx:latest

# Transfer wbesite distribution from previous image to this new one
COPY --from=front_build /tmp/node_build/sostrades-webgui/dist/sos-trades-gui /usr/share/nginx/html

# Transfer nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
