class AddPhotourlToUpvotes < ActiveRecord::Migration
  def change
    add_column :upvotes, :photourl, :string
  end
end
