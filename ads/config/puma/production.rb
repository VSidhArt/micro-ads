environment 'production'
bind 'unix:///path/to/shared/tmp/sockets/puma.sock'
pidfile '/path/to/shared/tmp/pids/puma.pid'
ctl_socket = '/path/to/shared/tmp/sockets/pumactl.sock'
state_path '/path/to/shared/tmp/sockets/puma.state'
stdout_redirect '/path/to/shared/log/stdout.log', '/path/to/shared/log/stderr.log'
activate_control_app 'unix:///path/to/shared/tmp/sockets/pumactl.sock'
daemonize
quiet

threads 5, 5
workers 2
preload_app!

before_fork do
  AdsApp::DB.disconnect if defined?(Ads::DB)
end
