ENV['APP_ENV'] = 'test'

require './plant_search.rb'
require 'test/unit'
require 'rack/test'

class PlantSearchTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    PlantSearch
  end

	def test_basic_api_call
    get '/api/tomato'

			assert last_response.ok?
    	assert  last_response.body.include?('tomato')
  end
end
