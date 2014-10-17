class postfix_graph (
  $maillog = '/var/log/mail.log'
){

  $maillog_path = $maillog ? {
    ''      => '/var/log/mail.log',
    default => $maillog
  }

  include postfix_graph::install
  include postfix_graph::config
  include postfix_graph::service

  Class['postfix_graph::install'] ->
  Class['postfix_graph::config'] ->
  Class['postfix_graph::service']
}
