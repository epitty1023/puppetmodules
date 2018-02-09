require 'spec_helper'
describe 'cloudwatchlogs', :type => :class do
  context 'default parameters on Amazon Linux' do
    let (:facts) {{
      :operatingsystem => 'Amazon',
      :concat_basedir  => '/var/lib/puppet/concat',
    }}
    it {
      should create_class('cloudwatchlogs')
      should contain_package('awslogs').with_ensure('present')
      should contain_concat('/etc/awslogs/awslogs.conf').with({
        'ensure'         => 'present',
        'owner'          => 'root',
        'group'          => 'root',
        'mode'           => '0644',
        'ensure_newline' => 'true',
        'warn'           => 'true',
      })
      should contain_service('awslogs').with({
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true',
        'hasstatus'  => 'true',
      })
    }
  end
  context 'only region on Ubuntu' do
    let (:params) {{
      :region => 'eu-west-1',
    }}
    let (:facts) {{
      :operatingsystem => 'Ubuntu',
      :concat_basedir  => '/var/lib/puppet/concat',
    }}
    it {
      should contain_package('wget').with_ensure('present')
      should contain_exec('cloudwatchlogs-wget').with({
        'path'    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
        'command' => 'wget -O /usr/local/src/awslogs-agent-setup.py https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py',
        'unless'  => '[ -e /usr/local/src/awslogs-agent-setup.py ]',
      })
      should contain_file('/etc/awslogs').with({
        'ensure' => 'directory',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0755',
      })
      should contain_concat('/etc/awslogs/awslogs.conf').with({
        'ensure'         => 'present',
        'owner'          => 'root',
        'group'          => 'root',
        'mode'           => '0644',
        'ensure_newline' => 'true',
        'warn'           => 'true',
      })
      should contain_file('/var/awslogs').with_ensure('directory')
      should contain_file('/var/awslogs/etc').with_ensure('directory')
      should contain_file('/var/awslogs/etc/awslogs.conf').with({
        'ensure' => 'link',
        'target' => '/etc/awslogs/awslogs.conf',
      })
      should contain_exec('cloudwatchlogs-install').with({
        'path'    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
        'command' => 'python /usr/local/src/awslogs-agent-setup.py -n -r eu-west-1 -c /etc/awslogs/awslogs.conf',
        'onlyif'  => '[ -e /usr/local/src/awslogs-agent-setup.py ]',
        'unless'  => '[ -d /var/awslogs/bin ]',
      })
      should contain_service('awslogs').with({
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true',
        'hasstatus'  => 'true',
      })
    }
  end
end
