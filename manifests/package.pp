class syslogng::package {

  include syslogng

  if $::operatingsystem == 'gentoo' {
    portage::package { 'app-admin/syslog-ng':
      keywords => $syslogng::gentoo_keywords,
      use      => $syslogng::gentoo_use,
      ensure   => $syslogng::package_ensure,
    }
  } else {
    package { $syslogng::package_name:
      ensure => $syslogng::package_ensure,
    }
  }

}
