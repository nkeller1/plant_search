require 'sinatra/base'
require './plant'

class NameSearch < Sinatra::Base
	def self.connect(name)
		conn = Faraday.get("https://www.growstuff.org/crops/#{name}.json")
		json = JSON.parse(conn.body,  symbolize_names: true)
		plant =	ApiPlant.new(json)
		plant.info
	end
end
