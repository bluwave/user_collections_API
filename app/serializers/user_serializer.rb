class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  # has_many :collections, through: :collection_connections
end
