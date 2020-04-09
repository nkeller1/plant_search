require 'sinatra/base'
require 'faraday'
require 'pry'
require 'sinatra/config_file'
require 'sinatra/json'

class PlantSearch < Sinatra::Base
  register Sinatra::ConfigFile
   config_file './config/application.yml'


		class Greeting
			def self.connect 
      		conn = Faraday.new(url: "https://trefle.io") do |faraday|
        		faraday.headers[:authorization] = ENV['TREFLE_API_KEY']
      		end

      		response = JSON.parse(conn.get("/api/plants/?common_name=rosemary").body, symbolize_names: true)
  		end
		end

	get '/' do
		json Greeting.connect
	end

   run! if app_file == $0
end
