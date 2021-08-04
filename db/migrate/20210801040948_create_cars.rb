class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :model
      t.string :color
      t.integer :brand_id
      t.integer :user_id

      t.timestamps
    end
  end
end
