require 'faraday'
require 'pry'

task :greet  do
	require_relative '../../plant_search.rb'
	system "rake db:reset"
	counter = 0
	8.times do	 
		counter += 1
		conn = Faraday.get("https://www.growstuff.org/crops.json?page=#{counter}")
 	 	json = JSON.parse(conn.body,  symbolize_names: true)
 	 	list = json.map do |plant|
		Plant.create(name: plant[:name], image: plant[:thumbnail_url], description:		 plant[:description], slug: plant[:slug])
		end
	end
end


