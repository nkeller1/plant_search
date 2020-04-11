require 'sinatra'
require 'faraday'
require 'pry'
require 'sinatra/config_file'
require 'sinatra/json'

class PlantSearch < Sinatra::Application
  register Sinatra::ConfigFile
   config_file './config/application.yml'


		class Greeting
			def self.connect(name)
      		conn = Faraday.get("https://www.growstuff.org/crops/#{name}.json")
					JSON.parse(conn.body,  symbolize_names: true)
  		end
		end

	get '/' do
		"Hi"
	end

	get '/api/:name' do
		json Greeting.connect(params[:name])
	end

end
