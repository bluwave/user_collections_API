class Message < ActiveRecord::Base
  belongs_to :collection
  belongs_to :user

  def self.find_by_pdp_id(user_id, pdp_id)

    # Collection.joins(:users => :collections).where(:collection_connections => {:user_id => user_id})
    # Message.joins(:user => :collections).where(:collection_connections => {:user_id => user_id}).where(:pdp_id => pdp_id)
    Message.where(:collection_id => Collection.joins(:users => :collections).where(:collection_connections => {:user_id => user_id}), :pdp_id => pdp_id).order(:id)

  end
end
