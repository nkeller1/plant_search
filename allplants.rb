require 'sinatra/base'
require './plantlist'

class AllPlants < Sinatra::Base

	def self.connect
		conn = Faraday.get("https://www.growstuff.org/crops.json")
		json = JSON.parse(conn.body,  symbolize_names: true)
    list = json.map do |plant|
		    new_plant = PlantList.new(plant)
        new_plant.info
    end

    list
	end
end
