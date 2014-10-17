class postfix_graph::config {

  ## mailgraph configuration

  file { '/etc/default/mailgraph':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('postfix_graph/mailgraph.erb'),
    notify  => Service['mailgraph'],
  }

}
