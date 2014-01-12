class Photo < ActiveRecord::Base
  attr_accessor :collection_item_id
  attr_accessor :collection_item_created_at
  
  has_many :collection_items, as: :item
end
