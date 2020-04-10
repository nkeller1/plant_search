require 'sinatra/base'
require 'faraday'
require 'pry'
require 'sinatra/config_file'
require 'sinatra/json'

class PlantSearch < Sinatra::Base
		class Greeting
			def self.connect(name)
      		conn = Faraday.get("https://www.growstuff.org/crops/#{name}.json")
					JSON.parse(conn.body,  symbolize_names: true)
  		end
		end

	get '/' do
		json Greeting.connect('tomato')
	end

   run! if app_file == $0
end
