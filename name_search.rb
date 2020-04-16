require 'sinatra/base'
require './api_plant'

class NameSearch < Sinatra::Base
	def self.connect(term)
		term = term.downcase
		terms = term.split('-')
		keyword = "%"
		terms.each do |term|
			keyword = keyword + term + "%"
		end
		results = Plant.where('plants.name LIKE ?', keyword).limit(10)
	end
end
