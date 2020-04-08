require 'sinatra/base'
require 'faraday'
require 'pry'
require 'sinatra/config_file'

class PlantSearch < Sinatra::Base
  register Sinatra::ConfigFile
   config_file './config/application.yml'
  # get '/' do
  #   'Hello world!'
  # end

    conn = Faraday.new(url: "https://trefle.io") do |faraday|
      faraday.headers[:authorization] = ENV['TREFLE_API_KEY']
    end

    response = conn.get("/api/plants/?common_name=rosemary")

    require "pry"; binding.pry

   run! if app_file == $0
end
