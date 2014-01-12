class Article < ActiveRecord::Base
  attr_accessor :collection_item_id
  attr_accessor :collection_item_created_at

  has_many :collection_items, as: :item
  def collections; Collection.find collection_items.pluck(:collection_id); end
end
