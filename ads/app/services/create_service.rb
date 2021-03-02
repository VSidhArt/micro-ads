require_relative './basic_service'

class CreateService
  prepend BasicService

  option :ad do
    option :title
    option :description
    option :city
  end

  option :user

  attr_reader :ad

  def call
    @ad = ::Ad.new(@ad.to_h.merge(user_id: @user))
    return fail!(@ad.errors) unless @ad.valid?
    @ad.save

    # GeocodingJob.perform_later(@ad)
  end
end
