class ApplicationController < ActionController::API
  serialization_scope :view_context
  rescue_from ActiveRecord::StatementInvalid, :with => :unsaveable_identity_handler

  rescue_from  Exception do |e|
    p "***application error handler: #{e.inspect}"
    error(e)
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  protected

  def error(e)
    if env["ORIGINAL_FULLPATH"] =~ /^\/api/
      error_info = {
          :error => "Internal Server Error",
          :exception => "#{e.class.name} : #{e.message}",
      }
      # error_info[:trace] = e.backtrace[0, 10] if Rails.env.development?
      render :json => error_info.to_json, :status => :internal_server_error
    else
      raise e
    end
  end

  def unsaveable_identity_handler(e)
    error_info = {
            :error => "Unable to save, missing parameters",
            # :exception => "#{e.class.name} : #{e.message}"
            :exception => "#{e.class.name}"
    }
    render :json => error_info.to_json, :status => :unprocessable_entity
  end

  def default_serializer_options
    {root: false}
  end
end
