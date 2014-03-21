class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :apns_token

      t.timestamps
    end
  end
end
