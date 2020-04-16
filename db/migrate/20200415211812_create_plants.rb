class CreatePlants < ActiveRecord::Migration[6.0]
  def change
		create_table :plants do |t|
			t.string :name
			t.string :image
			t.string :description
			t.string :slug
			t.timestamps
		end
  end
end
