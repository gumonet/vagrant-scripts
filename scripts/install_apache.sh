#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y apache2 libapache2-mod-php
sed -i "s/www-data/vagrant/" /etc/apache2/envvars
#Config apache
block="<VirtualHost *:80>
    # The ServerName directive sets the request scheme, hostname and port that
    # the server uses to identify itself. This is used when creating
    # redirection URLs. In the context of virtual hosts, the ServerName
    # specifies what hostname must appear in the request's Host: header to
    # match this virtual host. For the default virtual host (this file) this
    # value is not decisive as it is used as a last resort host regardless.
    # However, you must set it for any further virtual host explicitly.
    #ServerName www.example.com

    ServerAdmin webmaster@localhost
    ServerName wordpress.test
    ServerAlias www.wordpress.test
    DocumentRoot "/vagrant/www"
    $paramsTXT

    <Directory "/vagrant/www">
        AllowOverride All
        Require all granted
    </Directory>

    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn

    ErrorLog \${APACHE_LOG_DIR}/wordpress.test-error.log
    CustomLog \${APACHE_LOG_DIR}/wordpress.test-access.log combined

    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this host only
    # after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
"

echo "$block" > "/etc/apache2/sites-available/wordpress.test.conf"
ln -fs "/etc/apache2/sites-available/wordpress.test.conf" "/etc/apache2/sites-enabled/wordpress.test.conf"

a2dissite 000-default
ps auxw | grep apache2 | grep -v grep > /dev/null
# Assume user wants mode_rewrite support
sudo a2enmod rewrite
# Turn on headers support
sudo a2enmod headers
service apache2 restart