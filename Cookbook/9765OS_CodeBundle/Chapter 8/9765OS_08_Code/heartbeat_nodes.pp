node 'cookbook' {
  class { 'heartbeat::vip':
    ip1   => '10.96.247.132',
    ip2   => '10.96.247.133',
    node1 => 'cookbook',
    node2 => 'cookbook2',
    vip   => '10.96.247.134/24',
  }
}

node 'cookbook2' {
  class { 'heartbeat::vip':
    ip1   => '10.96.247.132',
    ip2   => '10.96.247.133',
    node1 => 'cookbook',
    node2 => 'cookbook2',
    vip   => '10.96.247.134/24',
  }
}