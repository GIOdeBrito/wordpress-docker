#!/bin/bash
set -e

echo "Waiting for MySQL"

sleep 10

echo "MySQL is ready"

# Change to the WordPress installation directory
cd /var/www/html

# Checks if the wp-config.php file exists, if not, creates a new one
if [ ! -f wp-config.php ]; then
	echo "File wp-config.php was not found. Creating a new wp-config.php file"

    # Generate wp-config.php using wp-cli
	wp core config 	--dbhost=$WORDPRESS_DB_HOST \
					--dbname=$WORDPRESS_DB_NAME \
					--dbuser=$WORDPRESS_DB_USER \
					--dbpass=$WORDPRESS_DB_PASSWORD \
					--allow-root
fi

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

	echo "Wordpress is now installed"
else
	echo "Wordpress is already installed"
fi

# Start apache2
/usr/local/bin/docker-entrypoint.sh apache2-foreground
