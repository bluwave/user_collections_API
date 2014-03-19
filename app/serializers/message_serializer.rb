class MessageSerializer < ActiveModel::Serializer
  attributes :id #, :collection_id, :author, :notes, :pdp_id, :image_id, :rating
  # belongs_to :collection

end
