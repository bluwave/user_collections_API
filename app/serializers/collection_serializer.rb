class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name

  # has_many :collection_connections, :key => "collaborators"

  has_many :messages, :limit => 1
  has_many :users, through: :collection_connections, :key => "collaborators"



end
