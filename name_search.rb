require 'sinatra/base'
require './api_plant'

class NameSearch < Sinatra::Base
	def self.connect(term)
		keyword = "%#{term.downcase}%" 
		results = Plant.where('plants.name LIKE ?', keyword).limit(10)
	end
end
