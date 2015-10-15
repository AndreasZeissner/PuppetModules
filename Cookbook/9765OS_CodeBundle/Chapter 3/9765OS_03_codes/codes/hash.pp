$interface = {name => 'eth0',
              address => '192.168.0.1'}
notify { "Interface ${interface[name]} has address ${interface[address]}": }