class CreatePlants < ActiveRecord::Migration[6.0]
  def change
		create_table :plants do |t|
			t.string :name
			t.string :image
			t.string :description
			t.bigint :api_id
			t.timestamps
		end
  end
end
