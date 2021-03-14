require 'hanami/router'

class Auth
  def self.router
    Hanami::Router.new do
      namespace '/v1' do
        get '/hanami', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
      end
    end
  end
end
