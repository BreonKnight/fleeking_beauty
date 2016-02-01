class AddPhotourlToDownvotes < ActiveRecord::Migration
  def change
    add_column :downvotes, :photourl, :string
  end
end
