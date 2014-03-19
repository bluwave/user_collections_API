class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name

  # has_many :collection_connections, :key => "collaborators"

  has_many :messages
  has_many :users, through: :collection_connections, :key => "collaborators"

end
