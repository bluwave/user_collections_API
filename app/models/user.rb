class User < ActiveRecord::Base
  has_many :collections, through: :collection_connections
  has_many :collection_connections
end
