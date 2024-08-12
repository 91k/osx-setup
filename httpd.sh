#!/bin/bash

echo "Устанавливаем httpd..."
brew install httpd
brew services stop httpd

HTTPD_CONF="/opt/homebrew/etc/httpd/httpd.conf"

sed -i '' 's/^Listen 8080/Listen 8888/' $HTTPD_CONF

# ~/Documents/Github/
DOCROOT="$HOME/Documents/Github"
sed -i '' "s|DocumentRoot \"/opt/homebrew/var/www\"|DocumentRoot \"$DOCROOT\"|" $HTTPD_CONF
sed -i '' "s|<Directory \"/opt/homebrew/var/www\">|<Directory \"$DOCROOT\">|" $HTTPD_CONF

echo "
<Directory \"$DOCROOT\">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>" >> $HTTPD_CONF

brew services start httpd

echo "Установка и настройка httpd завершены. Сервер доступен по адресу http://127.0.0.1:8888"