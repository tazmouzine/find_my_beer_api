require 'rest-client'
require 'json'

class GetGoogleCoffeeDetailsService
  def initialize(place_id)
    @place_id = place_id
  end

  def call
    begin
      base_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{@place_id}&key=#{Rails.application.credentials.google_place}"
      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse =>
      e.response
    end
  end
  
end