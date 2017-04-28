class ChangeTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :tag_id, :integer
    remove_column :tags, :listing_id, :integer
  end
end
