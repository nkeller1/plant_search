class ApiPlant

	def initialize(data)
		@name = data[:name]
		@perennial = data[:perennial]
		@first_harvest = data[:median_days_to_first_harvest]
		@last_harvest = data[:median_days_to_last_harvest]
		@description = data[:openfarm_data][:attributes][:description]
		@sun = data[:openfarm_data][:attributes][:sun_requirements]
		@image = data[:openfarm_data][:attributes][:main_image_path]
		@height = data[:openfarm_data][:attributes][:height]
		@spread = data[:openfarm_data][:attributes][:spread]
		@sowing = data[:openfarm_data][:attributes][:sowing_method]
		@spacing = data[:openfarm_data][:attributes][:row_spacing]
	end

	def info
		data = Hash.new
		data[:name] =  @name; data[:perennial] = @perennial; data[:first_harvest] = @first_harvest
		data[:last_harvest] = @last_harvest; data[:description] = @description; data[:sun] = @sun  
		data[:image] = @image; data[:height] = @height; data[:spread] = @spread; data[:sowing] = @sowing; data[:spacing] = @spacing
		data
	end
end
