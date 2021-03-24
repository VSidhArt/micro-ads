module GeoCoder
  module Api
    def get_coors(city)
      response = connection.get(URI.escape("coords?city=#{city}"))

      response.body if response.success?
    end
  end
end
