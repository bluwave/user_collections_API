class Collection < ActiveRecord::Base
  # has_many :collection_connections
  # belongs_to :user
  has_many :messages
  has_many :users, through: :collection_connections
  has_many :collection_connections

end
