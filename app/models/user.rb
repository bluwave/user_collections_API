class User < ActiveRecord::Base
  has_many :collections, through: :collection_connections
  has_many :collection_connections

  before_create :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end
end
