module Moonshine
  module Goliath
    def goliath(sent_options = {})
      default_options = {
        :port => 8000
      }

      options = HashWithIndifferentAccess.new(default_options.merge(configuration[:goliath] || {}))

      file "/etc/god/#{configuration[:application]}-goliath.god",
        :content => template(File.join(File.dirname(__FILE__), '..', '..', 'templates', 'goliath.god.erb'), binding),
        :ensure => :file,
        :notify => exec('restart_god'),
        :require => file('/etc/god/god.conf')
    end
  end
end
