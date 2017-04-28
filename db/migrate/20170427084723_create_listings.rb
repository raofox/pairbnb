class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :property_type # => bungalow, apartment, house etc
      t.integer :room_type # => shared, private, entire place etc.
      t.integer :guest # => number of guest allowed
      t.integer :bedroom
      t.integer :bathroom
      t.string :title
      t.string :summary
      t.string :address
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
