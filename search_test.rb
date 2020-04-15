ENV['APP_ENV'] = 'test'


require './plant_search.rb'
require 'test/unit'
require 'rack/test'
require 'rubygems'
require 'webmock'


class PlantSearchTest < Test::Unit::TestCase
  include Rack::Test::Methods
		json_response = File.read('fixtures/tomato.json')
		WebMock.stub_request(:get, "https://www.growstuff.org/crops/tomato.json").to_return(status: 200, body: json_response)

	  def app
  	  PlantSearch
  	end

		def test_basic_api_call
    get '/api/tomato'
			binding.pry
			assert last_response.ok?
    	assert  last_response.body.include?('tomato')
			assert last_response.body.include?('The tomato is the fruit of the tomato plant')
			assert last_response.body.include?('last_harvest')
			assert last_response.body.include?('height')
			assert last_response.body.include?('90')
			assert last_response.body.include?('https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments')
  	end
end
