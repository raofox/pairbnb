class AddVerificationToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :verification, :boolean
  end
end
