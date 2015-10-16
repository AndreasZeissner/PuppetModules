# Manage NFS server
class nfs {
  package { 'nfs-kernel-server': ensure => installed }

  service { 'nfs-kernel-server':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['nfs-kernel-server'],
  }

  file { '/etc/exports.d':
    ensure => directory,
  }

  exec { 'update-etc-exports':
    command     => '/bin/cat /etc/exports.d/* >/etc/exports',
    notify      => Service['nfs-kernel-server'],
    refreshonly => true,
  }
}
