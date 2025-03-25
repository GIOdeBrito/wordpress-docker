#!/bin/bash
set -e

echo "Waiting for MySQL"

#until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
#    sleep 2
#done

sleep 10

echo "MySQL is ready"

# Change to the WordPress installation directory
cd /var/www/html

# Check if WordPress is already installed
if ! wp core is-installed --allow-root; then
	echo "Installing Wordpress"

    # Install WordPress
    wp core install --url="http://localhost:8000" \
					--title="Wordpress-Docker Test" \
                    --admin_user="admin" \
                    --admin_password="123" \
					--admin_email="admin@admin.com" \
                    --allow-root

    # Activate the plugin
	wp plugin activate pluginteste --allow-root

	echo "Wordpress is now installed"
else
	echo "Wordpress is already installed"
fi

# Start apache2
/usr/local/bin/docker-entrypoint.sh apache2-foreground
