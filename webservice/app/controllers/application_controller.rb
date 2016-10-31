class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # verify user token
  before_filter :restric_access

  # handle unauth errors
  NotAuthorized = Class.new(StandardError)
  rescue_from NotAuthorized do |exception|
  	render_error_page(status: 403, text: 'Forbidden')
  end

  private
  # prevent users from accessing api unless token is correct
  def restric_access
  	api_key = (Rails.configuration.user_token == params[:token]) # pull token key from configs
  	raise NotAuthorized unless api_key
  end

  def render_error_page(status:, text:)
  	respond_to do |format|
  		format.json { render json: {error: 'You are not authorized to view this data. Please ensure you have entered the correct token for authentication.'} }
  		format.html { render file: "#{Rails.root}/public/#{status}.html", status: status, layout:false }
  	end
  end
end