# Package manager updates & repo management
apt-get update
apt-get install -y software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
add-apt-repository 'deb http://dl.hhvm.com/ubuntu trusty main'
add-apt-repository ppa:nginx/stable
apt-get update

# Set options for packages
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install NGINX, MySQL, HHVM
apt-get install -y git nginx hhvm mysql-server

# Configure nginx
mkdir -p /vagrant/www
sed -i "s/root .*/root \/vagrant\/www;/g" /etc/nginx/sites-available/default

# Add daemon
source /usr/share/hhvm/install_fastcgi.sh
update-rc.d hhvm defaults

# Restart services
service nginx restart
service hhvm restart
service mysql restart

# Done!
