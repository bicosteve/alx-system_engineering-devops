# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx is running and enabled
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}

# Create the default index page
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}

# Configure default site to include custom header using $hostname
# We escape $ with \$ to prevent Puppet from interpreting it
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => @(EOT),
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    add_header X-Served-By \$hostname;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
  EOT
  require => Package['nginx'],
  notify  => Service['nginx'],
}
