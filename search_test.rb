ENV['APP_ENV'] = 'test'

require './plant_search.rb'
require 'test/unit'
require 'rack/test'

class PlantSearchTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    PlantSearch
  end

	def test_it_says_hello_world
		correct = '[{"common_name":"rosemary","complete_data":false,"id":175919,"link":"http://trefle.io/api/plants/175919","scientific_name":"Rosmarinus","slug":"rosmarinus"},{"common_name":"rosemary","complete_data":true,"id":175920,"link":"http://trefle.io/api/plants/175920","scientific_name":"Rosmarinus officinalis","slug":"rosmarinus-officinalis"}]'
	
    get '/'
			assert last_response.ok?
    	assert_equal correct, last_response.body
  end
end
