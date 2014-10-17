class postfix_graph::service {

  ## Servizio mailgraph. L'applicazione gira come demone

  $mailgraph_pid = '/var/run/mailgraph.pid'

  service { 'mailgraph':
    ensure      => 'running',
    enable      => 'true',
    hasrestart  => 'true',
    hasstatus   => 'false',
    status      => "test -e ${mailgraph_pid}"
  }

  ## queuegraph: l'applicazione viene lanciata con un cron. Si pusha il cron
  ## con il modulo puppet in frequently

  file { '/etc/cron.d/queuegraph':
    ensure  => 'absent',
    before  => Cron::Entry['queuegraph'],
  }

  cron::entry {'queuegraph':
    frequency => 'frequently',
    user      => 'root',
    command   => 'test -x /usr/share/queuegraph/count.sh && /usr/share/queuegraph/count.sh >/dev/null 2>&1',
  }
}
