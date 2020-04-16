require 'sinatra/base'
require './plantlist'

class AllPlants < Sinatra::Base

	def self.connect
		Plant.all
	end
end
