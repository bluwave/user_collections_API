class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :collection_id, :null => false
      t.integer :user_id, :null => false
      t.text :notes
      t.integer :pdp_id
      t.integer :image_id
      t.integer :rating
      t.string  :thumbnail_url

      t.timestamps
    end
  end
end
