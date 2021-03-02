class AdsApp

  before do
    content_type 'application/json'
  end

  get '/' do
    ads = Ad.order(Sequel.desc(:updated_at))

    [200, {}, AdSerializer.new(ads, is_collection: true).serialized_json]
  end

  post '/' do
   payload = JSON.parse(request.body.read, symbolize_names: true)
   result = CreateService.call(ad: payload[:ad], user: payload[:user_id])

   if result.success?
     [200, {}, AdSerializer.new(result.ad).serialized_json]
    else
     error_response(result.ad, 422)
   end
  end

  def error_response(error_messages, status)
    errors = if error_messages.class.ancestors.include?(Sequel::Model)
      ::ErrorSerializer.from_model(error_messages)
    else
      ::ErrorSerializer.from_messages(error_messages)
    end

    [status, {}, errors]
  end
end
