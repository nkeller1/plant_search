class PlantList
  def initialize(data)
		@name = data[:name]
		@description = data[:description]
    @image =  data[:thumbnail_url]
	end

  def info
		data = Hash.new
		data[:name] =  @name
    data[:description] = @description
    data[:thumbnail_url] = @image
		data
	end
end
