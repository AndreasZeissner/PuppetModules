#!/usr/bin/ruby
require 'rubygems'
require 'fog'

HOSTNAME = 'devbox'
@server = ''

def command(cmdline)
  puts "Running command: #{cmdline}"
  res = @server.ssh( "sudo #{cmdline}" )[0]
  puts res.stdout
  puts res.stderr
end

def create()
  puts "Bootstrapping instance..."
  connection = Fog::Compute.new( { :provider => 'AWS',
                                   :region   => 'us-east-1',
                                   :aws_access_key_id     => 'AKIAI5SGMC3JWRQAPO3A',
                                   :aws_secret_access_key => 'iygf2+KV/inG3XOlEyrh+otazeVXrQJYKx8E7Sf' } )
  @server = connection.servers.bootstrap( :private_key_path => '~/bitfield.pem',
                                          :image_id => 'ami-137bcf7a',
                                          :username => 'ubuntu' )
  @server.wait_for { print "."; ready? }
  @server.wait_for { !public_ip_address.nil? }
  @server.reload
  puts "Instance name: #{@server.dns_name}"
  puts "Public IP: #{@server.ip_address}"
  puts "Setting hostname..."
  @server.ssh( "sudo hostname #{HOSTNAME}" )
end

def copy_bootstrap_files()
  puts "Copying bootstrap files..."
  @server.scp( "puppet.tar.gz", "/tmp" )
  @server.scp( "/usr/local/bin/bootstrap-ec2", "/tmp" )
end

def bootstrap()
  puts "Bootstrapping..."
  command( "sudo sh /tmp/bootstrap-ec2" )
end

create()
copy_bootstrap_files()
bootstrap()
