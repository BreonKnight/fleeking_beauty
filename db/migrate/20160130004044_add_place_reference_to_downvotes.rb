class AddPlaceReferenceToDownvotes < ActiveRecord::Migration
  def change
    add_reference :downvotes, :place, index: true, foreign_key: true
  end
end
