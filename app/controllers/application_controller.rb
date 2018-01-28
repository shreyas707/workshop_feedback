class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  protected
  def authenticate_user!
    	if user_signed_in?
      		super
    	else
      		redirect_to new_user_session_path, :notice => 'You need to login to access the page.'
    	end
  end

  def render_404
    redirect_to ('/public/404')
  end

end