class AddPlaceReferenceToUpvotes < ActiveRecord::Migration
  def change
    add_reference :upvotes, :place, index: true, foreign_key: true
  end
end
