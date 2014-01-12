class Collection < ActiveRecord::Base
  has_many :collection_items

  # Variant to solve of classic problem
  # To get array of polimorphic models
  # with many to many relation 

  # @collection.items
  # @collection.items(:posts)
  # @collection.items(:photos)
  # @collection.items(:articles)
  def items type = nil
    _items = []
    citems = collection_items.by_type(type)

    # data for Model selects
    to_select = citems.inject({}) do |hash, item|
      (hash[item.item_type] ||= []).push item.item_id
      hash
    end

    # Select Models groups
    groups = {}
    to_select.each_pair{ |klass, ids| groups[klass] = klass.constantize.find(ids) }
    
    # group Models ordered by position in collection items list
    citems.each do |citem|
      item = groups[citem.item_type].select{ |item| item.id == citem.item_id }.first

      item.collection_item_id = citem.id
      item.collection_item_created_at = citem.created_at

      _items << item
    end

    _items
  end
end