require 'sinatra'
require 'faraday'
require 'pry'
require 'sinatra/config_file'
require 'sinatra/json'
require 'sinatra/activerecord'
require './allplants'
require './name_search'
require './models/plant.rb'

set :database_file, 'config/database.yml'

class PlantSearch < Sinatra::Application
  register Sinatra::ConfigFile
   config_file './config/application.yml'

	get '/' do
		"Hi"
	end

	get '/api/:term' do
		json NameSearch.connect(params[:term])
	end

	get '/api/plants/:id' do
		json FindPlant.connect(params[:id])
	end

  get '/allplants' do
    json AllPlants.connect
  end
end
