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
			assert last_response.ok?
    	assert  last_response.body.include?('tomato')
			assert last_response.body.include?('The tomato is the fruit of the tomato plant')
  	end

    def test_all_plants_api_call
      get '/allplants'
  		assert last_response.ok?
    	assert  last_response.body.include?('tomato')
  		assert last_response.body.include?('The tomato is the fruit of the tomato plant')
  		assert last_response.body.include?('https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments')

      assert  last_response.body.include?('lettuce')
  		assert last_response.body.include?('Lettuce is a cool weather crop and high temperatures will impede germination and/or cause the plant to bolt')

      assert  last_response.body.include?('coriander')
    end

		def test_individual_plant
			get '/plant/tomato'
			assert  last_response.body.include?('tomato')
      assert last_response.body.include?('The tomato is the fruit of the tomato plant')
      assert last_response.body.include?('https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments')
		end
end
