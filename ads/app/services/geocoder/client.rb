require 'dry-initializer'
require 'uri'
require_relative './api'

module GeoCoder
  class Client
    extend Dry::Initializer[undefined: false]
    include GeoCoder::Api

    option :url, default: proc { 'http://localhost:9292' }
    option :connection, default: proc { build_connection }

    private

    def build_connection
      Faraday.new(@url) do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
