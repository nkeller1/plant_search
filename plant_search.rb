require 'sinatra'
require 'faraday'
require 'pry'
require 'sinatra/config_file'
require 'sinatra/json'
require 'sinatra/activerecord'
require_relative './allplants'
require_relative './name_search'
require_relative './models/plant.rb'
require_relative './find_plant.rb'


class PlantSearch < Sinatra::Base
	get '/' do
		"Hi"
	end

	get '/api/:term' do
		json NameSearch.connect(params[:term])
	end

	get '/plant/:slug' do
		json FindPlant.connect(params[:slug])
	end

  get '/allplants' do
    json AllPlants.connect
  end
end
