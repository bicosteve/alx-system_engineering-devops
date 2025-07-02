# Ensure nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Ensure nginx service is running and enabled
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}

# Create the index.html file with "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}

# Create a custom nginx config with 301 redirect
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => @(EOF),
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /redirect_me {
        return 301 https://example.com;
    }
}
  | EOF
  require => Package['nginx'],
  notify  => Service['nginx'],
}
