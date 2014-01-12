class CollectionItem < ActiveRecord::Base
  belongs_to :collection
  belongs_to :item, polymorphic: true

  validates :collection, presence: true
  validates :item_id, :item_type, presence: true
  validates :item_id, uniqueness: { scope: [:collection_id, :item_type] }

  scope :by_type, ->(_type) { _type.blank? ? all : where(item_type: _type.to_s.classify) }
end