require "hanami/middleware/body_parser"

module Auth
  module Web
    def self.app
      Rack::Builder.new do
        use Hanami::Middleware::BodyParser, :json
        run Auth::Web::Router
      end
    end
  end
end
