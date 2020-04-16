require 'sinatra/base'
require './api_plant'

class FindPlant < Sinatra::Base
  def self.connect(slug)
    conn = Faraday.get("https://www.growstuff.org/crops/#{slug}.json")
    json = JSON.parse(conn.body,  symbolize_names: true)
		if json[:openfarm_data]
	   plant = ApiPlant.new(json)
 	   plant.info
		else
			"Bad Plant"
		end
  end
end
