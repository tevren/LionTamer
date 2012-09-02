APP_CONFIG = YAML.load_file("#{Rails.root}/config/app_config.yml")[Rails.env]

Rails.application.config.middleware.use OmniAuth::Strategies::LDAP, 
  :host => "#{APP_CONFIG['ldap_host']}", 
  :port => "#{APP_CONFIG['ldap_port']}", 
  :method => "#{APP_CONFIG['ldap_method']}", 
  :base => "#{APP_CONFIG['ldap_base']}", 
  :uid => "#{APP_CONFIG['ldap_uid']}",
  :sasl_mechanisms => "#{APP_CONFIG['ldap_sasl_mechanisms']}", 
  :bind_dn => "#{APP_CONFIG['ldap_bind_dn']}", 
  :password => "#{APP_CONFIG['ldap_password']}"