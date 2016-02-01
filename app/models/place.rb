class Place < ActiveRecord::Base
  has_many :upvotes
  has_many :downvotes
end
