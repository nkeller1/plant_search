require 'sinatra/base'
require './api_plant'

class FindPlant < Sinatra::Base
  def self.connect(slug)
    conn = Faraday.get("https://www.growstuff.org/crops/#{slug}.json")
		if conn.body
    	json = JSON.parse(conn.body,  symbolize_names: true)
    	plant = ApiPlant.new(json)
    	plant.info
		else
			nil
		end
  end
end
