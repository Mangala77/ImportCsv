class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include Response
  include ExceptionHandler
  TOKEN = "secret123"
  before_action :authenticate
  
  
rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render json: "not_found", status: 404
  end

  
  private
  def authenticate
    authenticate_token || render_unauthorized
  end
    
  def authenticate_token
    authenticate_with_http_token do |token, options|
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(token),
        ::Digest::SHA256.hexdigest(TOKEN)
      )
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end
end
