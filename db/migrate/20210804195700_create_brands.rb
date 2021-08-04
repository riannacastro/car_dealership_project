class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :year_created
      t.integer :country_id

      t.timestamps
    end
  end
end
