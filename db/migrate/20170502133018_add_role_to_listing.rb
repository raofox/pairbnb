class AddRoleToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :role, :boolean
  end
end
