class MessageSerializer < ActiveModel::Serializer
  attributes :id , :collection_id, :user_id, :notes, :pdp_id, :image_id, :rating
  # belongs_to :collection

end
