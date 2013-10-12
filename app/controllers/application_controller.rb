class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def permission_denied
    if flash.key? :timedout
      flash[:error] = t('devise.failure.timeout')
    else
      flash[:error] = t('errors.messages.unauthorized')
    end
    redirect_to root_url
  end
  
end
