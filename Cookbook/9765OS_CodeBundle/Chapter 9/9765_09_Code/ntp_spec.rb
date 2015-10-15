require 'spec_helper'

describe 'admin::ntp' do
  it { should contain_package('ntp') }
  it { should contain_service('ntp').with(
    'ensure' => 'running'
  ) }
  it { should contain_file('/etc/ntp.conf') }
end