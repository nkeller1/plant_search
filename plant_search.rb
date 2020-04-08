require 'sinatra/base'
require 'faraday'
require 'pry'

class PlantSearch < Sinatra::Base
  # get '/' do
  #   'Hello world!'
  # end
  # def index
    conn = Faraday.new(url: "https://trefle.io") do |faraday|
      faraday.headers[:authorization] = 'MWkycXExWVRwWE91TDNzS0xMek9nUT09'
    end
  # end

    response = conn.get("/api/plants/?common_name=rosemary")

    require "pry"; binding.pry

   run! if app_file == $0
end
