FROM wordpress:latest

# Copies the installation files for wordpress to Apache's html folder
RUN cp -r /usr/src/wordpress/* /var/www/html/

#COPY .env ./

# Installs WP-CLI
RUN apt-get update && apt-get install -y wget less && \
    wget -q -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Copy the plugin to the wordpress plugins folder
COPY $PLUGIN_FOLDER /var/www/html/wp-content/plugins/pluginteste

RUN chown -R www-data:www-data /var/www/html/wp-content/plugins/pluginteste

# Copy the custom entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script as the default command
ENTRYPOINT ["/entrypoint.sh"]