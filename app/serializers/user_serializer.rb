class UserSerializer < ActiveModel::Serializer
  attributes :id, :email , :apns_token
  # has_many :collections, through: :collection_connections
end
