file { '/home/bico/.ssh/config':
  ensure  => file,
  owner   => 'bico',
  group   => 'bico',
  mode    => '0600',
  content => @("EOF")
    Host bixnode01
        HostName bix-node01
        User bico
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
    | EOF
}
