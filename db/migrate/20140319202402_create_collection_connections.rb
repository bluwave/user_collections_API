class CreateCollectionConnections < ActiveRecord::Migration
  def change
    create_table :collection_connections do |t|
      t.integer :collection_id
      t.integer :user_id
      t.timestamps
    end
  end
end
