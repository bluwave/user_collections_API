class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :collection_id, :null => false
      t.integer :user_id, :null => false
      t.text :notes
      t.string :pdp_id
      t.integer :image_id
      t.integer :rating
      t.string  :thumbnail_url

      t.timestamps
    end
    add_index :messages, :pdp_id
  end
end
