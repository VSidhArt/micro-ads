threads 4, 4
workers 2
preload_app!

before_fork do
  AdsApp::DB.disconnect if defined?(Ads::DB)
end
