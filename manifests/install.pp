# == Class postfix_graph::install
# TODO: dependency from postfix class missing
# TODO: dependency from apache class missing
class postfix_graph::install {
  Package {
    require => [ Package['rrdtool'] ]
  }

  package { 'mailgraph':
    ensure  => 'present',
  }

  package { 'queuegraph':
    ensure  => 'present',
  }
}
