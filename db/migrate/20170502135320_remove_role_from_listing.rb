class RemoveRoleFromListing < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :role, :string
  end
end
