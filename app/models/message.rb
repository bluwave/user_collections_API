class Message < ActiveRecord::Base
  belongs_to :collection
  belongs_to :user

  def self.find_by_pdp_id(collection_id, pdp_id)
    return where(:collection_id => collection_id, :pdp_id => pdp_id)
  end
end
