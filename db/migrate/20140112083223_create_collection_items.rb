class CreateCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.integer :collection_id
      t.references :item, polymorphic: true

      t.timestamps
    end
  end
end
