require "roda"
require "json"
require './geocoder'

class App < Roda
  route do |r|
    r.get "coords" do
      response['Content-Type'] = 'application/json'
      coordinates = Geocoder.geocode(r.params['city'])
      coordinates.to_json
    end
  end
end
