require 'sinatra'
require 'faraday'
require 'pry'
require 'sinatra/config_file'
require 'sinatra/json'
require './greeting'
require 'sinatra/activerecord'

class PlantSearch < Sinatra::Application
  register Sinatra::ConfigFile
   config_file './config/application.yml'

	get '/' do
		"Hi"
	end

	get '/api/:name' do
		json ApiPlant.connect(params[:name])
	end
end
