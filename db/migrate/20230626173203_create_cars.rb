class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.text :description
      t.string :color
      t.string :picture
      t.integer :price_per_day
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
