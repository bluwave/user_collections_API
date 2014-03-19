class AddNonNullNameAndOwnerToCollection < ActiveRecord::Migration
  def change
    change_column_null :collections, :name, false
    change_column_null :collections, :owner, false
  end
end
