class ApplicationController < ActionController::API
  serialization_scope :view_context

  def default_serializer_options
    {root: false}
  end
end
